class ChangeIsbnToInteger < ActiveRecord::Migration
  def change
    change_column :books, :isbn, :integer
  end
end
