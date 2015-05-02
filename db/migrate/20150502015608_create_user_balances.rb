class CreateUserBalances < ActiveRecord::Migration
  def change
    create_table :user_balances do |t|
      t.decimal :balance, precision: 8, scale: 2, null: false, default: 0  
      t.timestamps null: false
    end
    add_reference :user_balances, :user, index: true
    add_foreign_key :user_balances, :users
    add_reference :users, :user_balance, index: true
    add_foreign_key :users, :user_balances
  end
end
