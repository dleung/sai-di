class ArticleAttachment < ActiveRecord::Base
  attr_accessible :description, :attachment, :thumbnail, :title
  belongs_to :article
  mount_uploader :attachment, AttachmentUploader

  
end
