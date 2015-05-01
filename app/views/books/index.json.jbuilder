json.array!(@books) do |book|
  json.extract! book, :id, :book_id, :title, :author, :isbn, :condition, :comments, :owner_email
  json.url book_url(book, format: :json)
end
