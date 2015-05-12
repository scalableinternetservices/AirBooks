class WelcomeController < ApplicationController
  def index
    #might not be scalable need to check
    @books = Book.where.not(image_file_name: nil).order(:created_at).reverse_order.last(50).sample(20)
  end
end
