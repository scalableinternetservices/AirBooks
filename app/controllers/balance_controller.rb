class BalanceController < ApplicationController
  before_filter :authenticate_user!
  def index
    @balance = current_user.user_balance
    if !@balance then
      @balance = UserBalance.new
      current_user.user_balance = @balance
    end
  end

  def add
    @balance = current_user.user_balance
  end

  def remove
    @balance = current_user.user_balance
  end

  def update
    @balance = current_user.user_balance
    attributes = user_balance_params.clone
    # render :text => attributes[:update_type]
    if attributes['update_type'].eql? 'add' then
      attributes[:balance] = attributes[:balance].to_d + @balance.balance
    else
      attributes[:balance] = @balance.balance - attributes[:balance].to_d 
    end
    respond_to do |format|
      if @balance.update attributes.except(:update_type) then
        format.html { redirect_to @balance, notice: 'Funds were successfully updated.' }
        format.json { render :index, status: :ok, location: @balance }
      else
        format.html { render :add }
        format.json { render json: @balance.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def user_balance_params
      params.require(:user_balance).permit(:balance, :update_type)
    end
end
