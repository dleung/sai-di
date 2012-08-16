class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :body
      t.text :attachments
      t.string :coordinates
      t.string :title
      t.string :author
      t.timestamps
    end
  end
end
