json.extract! reply, :id, :author, :created_at, :updated_at
json.url reply_url(reply, format: :json)
