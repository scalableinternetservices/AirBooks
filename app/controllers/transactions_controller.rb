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
      total_price = @transaction.price * ((Date.today - @transaction.start_date.to_date).to_i + 1)
      # current_user is renter
      current_renter_balance = current_user.user_balance.balance
      lender = get_user_by_email(@transaction.seller_email)
      current_lender_balance = lender.user_balance.balance
      new_renter_balance = current_renter_balance - total_price
      new_lender_balance = current_lender_balance + total_price
      if total_price <= current_renter_balance
        @transaction.end_date = DateTime.now
        @transaction.save
        Book.find_by_id(@transaction.book_id).update_attribute :checked_out, false
        total_price = @transaction.price * (Date.today - @transaction.start_date.to_date).to_i
        current_user.user_balance.update_attribute :balance, (new_renter_balance)
        lender.user_balance.update_attribute :balance, (new_lender_balance)
        respond_to do |format|
          format.html { redirect_to transactions_url , notice: 'Book was successfully returned. Your balance has been updated.' }
          #format.html { redirect_to url_for(controller: 'balance', action: 'update', balance: total_price, update_type: 'remove') , notice: 'Book was successfully returned.' }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          @temp = true
          format.html { redirect_to transactions_url, notice: "Insufficient Balance! Please deposit at least #{ActionController::Base.helpers.number_to_currency(-new_renter_balance)} to complete this transaction." }
          #format.html { redirect_to url_for(controller: 'balance', action: 'update', balance: total_price, update_type: 'remove') , notice: 'Book was successfully returned.' }
          format.json { head :no_content }
        end
      end

    end

  end
  def return_book
    @transaction.end_date = DateTime.now
    @transaction.save
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
      # additional_params = {}
      additional_params = {buyer_email: current_user.email, seller_email: @book.owner_email, start_date: DateTime.now, price: @book.price}
      params.permit(:book_id).merge(additional_params)
    end
end
