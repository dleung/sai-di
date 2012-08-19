# This migration comes from demo (originally 20120818235714)
class CreateDemoPosts < ActiveRecord::Migration
  def change
    create_table :demo_posts do |t|
      t.string :title

      t.timestamps
    end
  end
end
