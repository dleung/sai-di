class ChangesToArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :excerpt
    add_column :article_attachments, :description, :text
  end
end
