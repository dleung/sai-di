class AddMapContentToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :map_title, :string
  end
end
