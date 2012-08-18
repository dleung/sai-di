class RemoveDescriptionFromAttachments < ActiveRecord::Migration
  def change
    remove_column :article_attachments, :description
  end
end
