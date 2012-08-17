class ArticleAttachment < ActiveRecord::Base 
  attr_accessible :description, :attachment, :thumbnail, :title
  validates :title, presence: true
  belongs_to :article
  mount_uploader :attachment, AttachmentUploader
end
