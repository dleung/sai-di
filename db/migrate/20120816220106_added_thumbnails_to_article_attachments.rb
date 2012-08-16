class AddedThumbnailsToArticleAttachments < ActiveRecord::Migration
  def up
    add_column :article_attachments, :thumbnail, :string
  end

  def down
    remove_column :article_attachments, :thumbnail
  end
end
