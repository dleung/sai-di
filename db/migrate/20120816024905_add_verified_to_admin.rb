class AddVerifiedToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :manual_verified, :boolean
  end
end
