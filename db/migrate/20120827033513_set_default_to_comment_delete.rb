class SetDefaultToCommentDelete < ActiveRecord::Migration
def up
    change_column :comments, :deleted, :boolean, :default => false
    Comment.all.each do |comment|
      comment.deleted = false
      comment.save
    end
end

def down
    change_column :comments, :deleted, :boolean, :default => nil
end
end
