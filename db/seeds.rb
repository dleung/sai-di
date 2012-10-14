# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admins = []

admin = Admin.find_or_create_by_email('davleun@gmail.com')
admin.name = "David Leung"
admins << admin

admin = Admin.find_or_create_by_email('macy.m.leung@gmail.com')
admin.name = "Macy Leung"
admins << admin

admin = Admin.find_or_create_by_email('demo@demo.com')
admin.name = "Demo User"
admins << admin

admins.each do |admin|
  admin.password = "demo123"
  admin.manual_verified = true
  admin.save
end

