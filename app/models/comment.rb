class Comment < ActiveRecord::Base
  require 'obscenity/active_model'
  attr_accessible :body, :user_id
  belongs_to :user
  belongs_to :article
  validates :body, presence: true
  validates :body, obscenity: true
  has_many :replies, :class_name => "Comment",
    :foreign_key => "comment_id"
  belongs_to :comment, :class_name => "Comment"
  
  scope :not_deleted, where(:deleted => false)
end
