class SearchController < ApplicationController
  def results
  	@books = Book.where("(author like ? OR title like ?) AND due_date > ?", "%#{params[:q]}%", "%#{params[:q]}%", Date.today)
  	render "index"
  end
end
