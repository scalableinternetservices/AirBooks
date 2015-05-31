class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show]

  # GET /books
  # GET /books.json
  def index
    list = Book.search do
      with(:owner_email, current_user.email)
      order_by(:updated_at, :desc)
      paginate :page => params[:page], :per_page => 10
    end
    @books = list.results
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @reviews = Book.find(@book).book_review.order("created_at DESC") #check index
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    redirect_to @book unless current_user.email == @book.owner_email
  end

  # POST /books
  # POST /books.json
  def create
    Rails.logger.debug("CREATING BOOK")
    @book = Book.new(book_params)
    Rails.logger.debug(" BOOK CREATED due date: #{@book.due_date}")

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if params[:from] == "relist"
          Rails.logger.debug("REACHED HERE 567")
          book_relist = params[:book_relist]
          date = Date.new book_relist["due_date(1i)"].to_i, book_relist["due_date(2i)"].to_i, book_relist["due_date(3i)"].to_i
          @book.update_attribute :due_date, date
          @book.update_attribute :price, params[:price]
          format.html { redirect_to books_url, notice: 'Book was successfully updated.' }
      else
        if @book.update(book_params)
          format.html { redirect_to @book, notice: 'Book was successfully updated.' }
          format.json { render :show, status: :ok, location: @book }
        else
          format.html { render :edit }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.update_attribute :due_date, DateTime.new(2000,1,1)
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully unlisted.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :isbn, :genre, :condition, :price, :due_date, :comments, :image).merge(owner_email: current_user.email)
    end
end
