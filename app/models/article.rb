class Article < ActiveRecord::Base
  attr_accessible :title, :body, :remove_attachment, :coordinates
  
  has_many :article_attachments, dependent: :destroy
  accepts_nested_attributes_for :article_attachments
end
