class Article < ActiveRecord::Base
  
  mount_uploader :attachment, AttachmentUploader
  # attr_accessible :title, :body
end
