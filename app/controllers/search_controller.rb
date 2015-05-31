class SearchController < ApplicationController
  def results

    #if empty order by updated_at
    if params[:q].empty?
      search = Book.search do
        order_by(:updated_at,:desc)
        with(:due_date).greater_than Time.now
        paginate :page => params[:page], :per_page => 10
      end
    else
    #search for a book with exact isbn
      search = Book.search do
        with(:isbn, params[:q])
        with(:due_date).greater_than Time.now
        paginate :page => params[:page], :per_page => 10
      end
    end

    #if there is no book with exact isbn, search using fulltext
    if search.results.any? == false
      search = Book.search do
        fulltext params[:q]
        with(:due_date).greater_than Time.now
        paginate :page => params[:page], :per_page => 10
      end
    end

    @books = search.results

  	render 'index'
  end
end
