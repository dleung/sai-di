class AddPhotoToArticleAttachment < ActiveRecord::Migration
  def up
    remove_column :article_attachments, :file
    remove_column :article_attachments, :description
    add_column :article_attachments, :attachment, :string
    add_column :article_attachments, :url, :string
  end
  
  def down
    remove_column :article_attachments, :attachment
    add_column :article_attachments, :file, :string
    add_column :article_attachments, :description, :string
  end
end
