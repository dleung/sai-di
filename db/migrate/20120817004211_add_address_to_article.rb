class AddAddressToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :address, :string
    add_column :articles, :public, :boolean
  end
end
