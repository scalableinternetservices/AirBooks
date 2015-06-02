class Transaction < ActiveRecord::Base
  searchable do
    string :buyer_email
    string :seller_email

    time    :updated_at
  end

  handle_asynchronously :solr_index, queue: 'indexing', priority: 50
  handle_asynchronously :solr_index!, queue: 'indexing', priority: 50
end
