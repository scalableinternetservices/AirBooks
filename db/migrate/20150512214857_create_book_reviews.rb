class CreateBookReviews < ActiveRecord::Migration
  def change
    create_table :book_reviews do |t|
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :rating, null: false
      t.text :review
      
      t.timestamps null: false
    end
  end
end
