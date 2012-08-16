class ChangedSomeColumnNames < ActiveRecord::Migration
  def up
    remove_column :articles, :attachments
    add_column :article_attachments, :title, :string
  end

  def down
    add_column :articles, :attachments, :string
    remove_column :article_attachments, :title
  end
end
