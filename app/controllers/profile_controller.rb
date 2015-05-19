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
    @lent_transactions = Transaction.where('seller_email= ?', @user.email)
    @borrowed_transactions = Transaction.where('buyer_email=?', @user.email)
  end

  def edit
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(profile_params)
        format.html { redirect_to profile_path(@user), notice: 'Your profile was successfully updated.' }
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
