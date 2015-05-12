class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :buyer_email
      t.string :seller_email
      t.integer :book_id
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :price, :precision => 8, :scale => 2
      t.timestamps null: false
    end
  end
end
