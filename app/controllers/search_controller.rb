class SearchController < ApplicationController
  def results
  	@books = Book.where("title like ? AND due_date > ?", "%#{params[:q]}%", Date.today)
  	render "index"
  end
end
