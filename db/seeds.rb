# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Contractor.delete_all
Booking.delete_all
Category.delete_all
Listing.delete_all

category_1 = Category.create!(name: 'Plumber')
category_2 = Category.create!(name: 'Carpenter')
category_3 = Category.create!(name: 'Crafts')
category_4 = Category.create!(name: 'Painter')
category_5 = Category.create!(name: 'Electrician')
category_6 = Category.create!(name: 'Engineer')


admin_user = User.create!(first_name: 'Sadiq', last_name: 'Okocha', address: '8 alhaji kanike close', phone_number: '07534092880', email: "admin@specialist.com", password: 'password', role: "admin", user_avatar: 'http://organicthemes.com/demo/profile/files/2012/12/profile_img.png')

normal_user1 = User.create!(first_name: 'James', last_name: 'fajimolu', address: '12 sanusfi fafunwa',phone_number: '08188699925',email: "user@specialist.com", password: 'password', role: "user", user_avatar: 'http://www.realtimearts.net/data/images/art/46/4640_profile_nilssonpolias.jpg' )

normal_user2 = User.create!(first_name: 'Chudi', last_name: 'Ngonadi', address: '33 alfred rewane',phone_number: '07458720993', email: "user1@specialist.com", password: 'password', role: "user", user_avatar: 'http://dev.sol-technology.com.au/QUT/images/profile/tempProfile1.jpg')

contractor_admin = Contractor.create!(user_id: admin_user.id, wage: 235, category_id: Category.first.id)
contractor_1 = Contractor.create!(user_id: normal_user1.id, wage: 2114, category_id: Category.last.id) 
contractor_2 = Contractor.create!(user_id: normal_user2.id, wage: 2114, category_id: Category.first(2).last.id)





