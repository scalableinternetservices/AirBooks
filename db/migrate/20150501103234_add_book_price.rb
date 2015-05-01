class AddBookPrice < ActiveRecord::Migration
  def change
  	add_column :books, :price, :decimal, :precision => 8, :scale => 2
  	add_column :books, :due_date, :date
  end
end
