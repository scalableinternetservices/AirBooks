class Transaction < ActiveRecord::Base
  searchable do
    string :buyer_email
    string :seller_email

    time    :updated_at
  end
end
