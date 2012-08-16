class ArticleAttachment < ActiveRecord::Base
  attr_accessible :description, :file
  belongs_to :attachable, :polymorphic => true
  mount_uploader :attachment, AttachmentUploader
end
