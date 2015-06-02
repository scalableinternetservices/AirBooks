class WelcomeController < ApplicationController
  def index
    #might not be scalable need to check
    @books = Book.where.not(image_file_name: nil).order(:created_at).reverse_order.last(50).sample(20)

    @books_count = Rails.cache.fetch("books_count", expires_in: 1.hour) do
    	Book.where("checked_out IS FALSE AND title LIKE ? OR author LIKE ? OR comments LIKE ?", "%92%", "%92%", "%92%").count
    end
  end
end
	