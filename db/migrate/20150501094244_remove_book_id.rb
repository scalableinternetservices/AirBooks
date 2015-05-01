class RemoveBookId < ActiveRecord::Migration
  def change
  	remove_column :books, :book_id
  end
end
