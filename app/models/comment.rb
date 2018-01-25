class Comment < ApplicationRecord
  belongs_to :user
  validates_presence_of :content, :title
  has_many :replies, dependent: :destroy

  #at most 12 Thread posts per page
  self.per_page = 12
end
