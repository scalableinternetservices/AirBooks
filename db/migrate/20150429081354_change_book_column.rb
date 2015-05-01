class ChangeBookColumn < ActiveRecord::Migration
  def change
  	change_column :books, :comments, :text
  end
end
