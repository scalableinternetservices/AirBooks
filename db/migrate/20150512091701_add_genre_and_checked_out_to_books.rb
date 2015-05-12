class AddGenreAndCheckedOutToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :genre, :string
  	add_column :books, :checked_out, :boolean, :default => false
  	Book.update_all(checked_out: false)
  end
end
