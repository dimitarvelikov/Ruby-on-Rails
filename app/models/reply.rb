class Reply < ApplicationRecord
  validates_presence_of :text
  validates_presence_of :title

  belongs_to :comment, optional: true, foreign_key: 'post_id'
  belongs_to :reply, optional: true, polymorphic: true

  #dependent:destroy deletes the nested comments on Thread delete
  has_many :replies, dependent: :destroy
  accepts_nested_attributes_for :replies
end
