class ProfileController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def redirect
    redirect_to profile_path(current_user)
  end

  # GET /books/1
  # GET /books/1.json
  def show
    buy = Transaction.search do
      with(:buyer_email, current_user.email)
      order_by(:updated_at, :desc)
      paginate :page => params[:buy_page], :per_page => 12
    end

    sell = Transaction.search do
      with(:seller_email, current_user.email)
      order_by(:updated_at, :desc)
      paginate :page => params[:sell_page], :per_page => 12
    end

    @borrowed_transactions = buy.results
    @lent_transactions = sell.results
  end

  def edit
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(profile_params)
        format.html { redirect_to profile_path, notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      if params[:id].nil?
        @user = current_user
      else
        @user = User.find(params[:id])
      end
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:user).permit(:name, :occupation, :location, :public_email, :phone, :website, :about_me, :interests)
    end

end
