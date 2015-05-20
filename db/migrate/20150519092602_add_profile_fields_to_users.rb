class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :occupation, :string
    add_column :users, :public_email, :string
    add_column :users, :website, :string
    add_column :users, :about_me, :text
    add_column :users, :interests, :text
  end
end
