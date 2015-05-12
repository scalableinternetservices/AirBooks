class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [:create]
  before_filter :authenticate_user!

  helper_method :get_book
  helper_method :get_seller

  # GET /transactions
  # GET /transactions.json
  def index
    # @transactions = Transaction.where(buyer_email: current_user.email).or(seller_email: current_user.email)
    @transactions = Transaction.where('buyer_email=? OR seller_email= ?', current_user.email, current_user.email)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    Rails.logger.debug("CREATING TRANSACTION CHECKING")
    @transaction = Transaction.new(transaction_params)
    @book.update_attribute :checked_out, true
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @book, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    if @transaction.end_date.nil?
      @transaction.end_date = DateTime.now
      @transaction.save
      Book.find_by_id(@transaction.book_id).update_attribute :checked_out, false
    end
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Book was successfully returned.' }
      format.json { head :no_content }
    end
  end
  def return_book
    @transaction.end_date = DateTime.now
    @transaction.save
  end

  def get_book(book_id)
      Book.find(book_id)
  end
  def get_seller(seller_email)
      User.find_by_email(seller_email)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
    	@transaction = Transaction.find(params[:id])
    end
    def set_book
      Rails.logger.debug("SETTING BOOK CHECKING")
      @book = Book.find(params[:book_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      # params.require(:transaction)
      additional_params = {}
      additional_params = {buyer_email: current_user.email, seller_email: @book.owner_email, start_date: DateTime.now, price: @book.price}
      params.permit(:book_id).merge(additional_params)
    end
end
