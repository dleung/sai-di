# This migration comes from news_feed_sample_app (originally 20120811032041)
class CreateMessages < ActiveRecord::Migration
  def change
    create_table :news_feed_sample_app_messages do |t|
      t.string :title
      t.timestamps
    end
  end
end
