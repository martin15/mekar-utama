# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
username = User.find_or_create_by_email(:email => "martin.me15@yahoo.com",
                                        :password => "1q2w3e4r5t",
                                        :password_confirmation => "1q2w3e4r5t")
puts username.inspect

pencil =  Category.find_or_create_by_name(:name => "Pencil")
puts pencil.inspect

embroidery =  Category.find_or_create_by_name(:name => "Embroidery")
puts embroidery.inspect

about_us =  Setting.find_or_create_by_name(:name => "about_us")
puts about_us.inspect

contact_us =  Setting.find_or_create_by_name(:name => "contact_us")
puts contact_us.inspect



