json.extract! comment, :id, :title, :content, :anonymous, :user_id, :created_at, :updated_at
json.url api_comment_url(comment, format: :json)