class ReviewsController < ApplicationController
  before_action :set_book, only: [:index, :new, :create, :destroy]
  before_action :set_review, only: [:show, :destroy]

  def index
    @reviews = Book.find(@book).book_review.order("created_at DESC")
  end

  def show
  end

  def new
    @review = BookReview.new
  end

  def create
    @review = BookReview.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @book, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Review was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:book_id])
    end

    def set_review
      @review = BookReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:book_review).permit(:rating, :review).merge(user: current_user, book: @book)
    end
end
