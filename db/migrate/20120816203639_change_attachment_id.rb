class ChangeAttachmentId < ActiveRecord::Migration
  def up
    remove_column :article_attachments, :attachable_id
    add_column :article_attachments, :article_id, :integer
  end
  def down
    add_column :article_attachments, :attachable_id, :integer
    remove_column :article_attachments, :article_id
  end
end
