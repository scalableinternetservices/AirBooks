class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.string :condition
      t.string :comments
      t.string :owner_email

      t.timestamps null: false
    end
  end
end
