class ChangeArticleAuthorToInteger < ActiveRecord::Migration
  def up
    remove_column :articles, :author
    add_column :articles, :author_id, :integer
  end
  def down
    remove_column :articles, :author_id
    add_column :articles, :author, :string
  end
end
