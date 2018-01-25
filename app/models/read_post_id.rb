class ReadPostId < ApplicationRecord
  validates_presence_of :read_id
  belongs_to :user
end
