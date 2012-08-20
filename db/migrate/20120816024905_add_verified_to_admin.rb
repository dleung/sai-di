class AddVerifiedToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :manual_verified, :boolean
  end
  
  def up
    admin = Admin.create!( :email => 'davleun@gmail.com', :password => 'icecream', name: "David Leung")
    admin.manual_verified = true
    admin.save! 
  end
end
