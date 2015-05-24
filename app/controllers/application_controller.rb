class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead

  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :get_book, :get_seller, :get_user_by_email

  def get_book(book_id)
      Book.find(book_id)
  end

  def get_seller(seller_email)
      User.find_by_email(seller_email)
  end

  def get_user_by_email(email)
      User.find_by_email(email)
  end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :phone, :location) }
        end
end
