puts "seeding admins"
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

puts "Page Contents for Company"
page = Page.find_or_create_by_title("Company")
page.body = File.read('company_content')
page.save

puts "Page Contents for Thinking"
page = Page.find_or_create_by_title("Thinking")
page.body = File.read('thinking_content')
page.save

puts "contents for People page"
page= Page.find_or_create_by_title("People")
page.body = File.read('people_content')
page.save 


