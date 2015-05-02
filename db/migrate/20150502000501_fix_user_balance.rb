class FixUserBalance < ActiveRecord::Migration
  def change
    remove_column :users, :balance, :decimal
    add_column :users, :balance, :decimal, :precision => 8, :scale => 2, :null => false, :default => 0
  end
end
