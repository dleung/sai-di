class CreateArticleAttachments < ActiveRecord::Migration
  def change
    create_table :article_attachments do |t|
      t.text :description
      t.string :file
      t.references :attachable
      t.timestamps
    end
  end
end
