class Add < ActiveRecord::Migration
  def change
    add_column :articles, :published, :boolean
    add_column :article_attachments, :published, :boolean
  end
end
