json.extract! book, :id, :title, :author_id, :publishing, :created_at, :updated_at
json.url book_url(book, format: :json)
