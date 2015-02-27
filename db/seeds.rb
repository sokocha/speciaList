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
category_3 = Category.create!(name: 'Craftsman')
category_4 = Category.create!(name: 'Photographer')
category_5 = Category.create!(name: 'Electrician')
category_6 = Category.create!(name: 'Engineer')


admin_user = User.create!(first_name: 'Sadiq', last_name: 'Okocha', address: '8 alhaji kanike close, ikoyi, lagos', phone_number: '07534092880', email: "admin@specialist.com", password: 'password', role: "admin", user_avatar: 'http://organicthemes.com/demo/profile/files/2012/12/profile_img.png')

normal_user1 = User.create!(first_name: 'James', last_name: 'fajimolu', address: '12 sanusfi fafunwa, victoria island, lagos',phone_number: '08188699925',email: "user@specialist.com", password: 'password', role: "user", user_avatar: 'http://www.realtimearts.net/data/images/art/46/4640_profile_nilssonpolias.jpg' )

normal_user2 = User.create!(first_name: 'Chudi', last_name: 'Ngonadi', address: '33 alfred rewane, ikoyi, lagos',phone_number: '07458720993', email: "user1@specialist.com", password: 'password', role: "user", user_avatar: 'http://dev.sol-technology.com.au/QUT/images/profile/tempProfile1.jpg')


normal_user3 = User.create!(first_name:Faker::Name.first_name, last_name: Faker::Name.first_name, address: Faker::Address.street_address, phone_number: Faker::Number.number(11), email: Faker::Internet.safe_email, password: 'password', role: 'user', user_avatar: Faker::Avatar.image)

normal_user4 = User.create!(first_name:Faker::Name.first_name, last_name: Faker::Name.first_name, address: Faker::Address.street_address, phone_number: Faker::Number.number(11), email: Faker::Internet.safe_email, password: 'password', role: 'user', user_avatar: Faker::Avatar.image)

normal_user5 = User.create!(first_name:Faker::Name.first_name, last_name: Faker::Name.first_name, address: Faker::Address.street_address, phone_number: Faker::Number.number(11), email: Faker::Internet.safe_email, password: 'password', role: 'user', user_avatar: Faker::Avatar.image)

normal_user6 = User.create!(first_name:Faker::Name.first_name, last_name: Faker::Name.first_name, address: Faker::Address.street_address, phone_number: Faker::Number.number(11), email: Faker::Internet.safe_email, password: 'password', role: 'user', user_avatar: Faker::Avatar.image)

normal_user7 = User.create!(first_name:Faker::Name.first_name, last_name: Faker::Name.first_name, address: Faker::Address.street_address, phone_number: Faker::Number.number(11), email: Faker::Internet.safe_email, password: 'password', role: 'user', user_avatar: Faker::Avatar.image)

normal_user8 = User.create!(first_name:Faker::Name.first_name, last_name: Faker::Name.first_name, address: Faker::Address.street_address, phone_number: Faker::Number.number(11), email: Faker::Internet.safe_email, password: 'password', role: 'user', user_avatar: Faker::Avatar.image)

normal_user9 = User.create!(first_name:Faker::Name.first_name, last_name: Faker::Name.first_name, address: Faker::Address.street_address, phone_number: Faker::Number.number(11), email: Faker::Internet.safe_email, password: 'password', role: 'user', user_avatar: Faker::Avatar.image)

normal_user10 = User.create!(first_name:Faker::Name.first_name, last_name: Faker::Name.first_name, address: Faker::Address.street_address, phone_number: Faker::Number.number(11), email: Faker::Internet.safe_email, password: 'password', role: 'user', user_avatar: Faker::Avatar.image)

contractor_admin = Contractor.create!(user_id: admin_user.id, wage: 235, category_id: Category.first.id, verified: true, certified: true)

contractor_1 = Contractor.create!(user_id: normal_user1.id, wage: 2114, category_id: Category.last.id, verified: true, certified: false) 

contractor_2 = Contractor.create!(user_id: normal_user2.id, wage: 2114, category_id: Category.first(2).last.id, verified:true, certified:false)

contractor_3 = Contractor.create!(user_id: normal_user3.id, wage: Faker::Number.number(4), category_id: Category.first(3).last.id, verified:true, certified:true)

contractor_4 = Contractor.create!(user_id: normal_user4.id, wage: Faker::Number.number(4), category_id: Category.first(4).last.id, verified:true, certified:true)

contractor_5 = Contractor.create!(user_id: normal_user5.id, wage: Faker::Number.number(4), category_id: Category.first(5).last.id, verified:false, certified:false)

contractor_6 = Contractor.create!(user_id: normal_user6.id, wage: Faker::Number.number(4), category_id: Category.first(6).last.id, verified:true, certified:false)

contractor_7 = Contractor.create!(user_id: normal_user7.id, wage: Faker::Number.number(4), category_id: Category.first(1).last.id, verified:false, certified:false)

contractor_8 = Contractor.create!(user_id: normal_user8.id, wage: Faker::Number.number(4), category_id: Category.first(2).last.id, verified:true, certified:true)

contractor_9 = Contractor.create!(user_id: normal_user9.id, wage: Faker::Number.number(4), category_id: Category.first(3).last.id, verified:true, certified:false)

contractor_10 = Contractor.create!(user_id: normal_user10.id, wage: Faker::Number.number(4), category_id: Category.first(4).last.id, verified:true, certified:false)


listing_1 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_1.id , user_id: admin_user.id, listing_image: Faker::Company.logo)
listing_2 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_2.id , user_id: admin_user.id, listing_image: Faker::Company.logo)
listing_3 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_3.id , user_id: admin_user.id, listing_image: Faker::Company.logo)
listing_4 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_2.id , user_id: normal_user1.id, listing_image: Faker::Company.logo)
listing_5 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_3.id , user_id: normal_user1.id, listing_image: Faker::Company.logo)
listing_6 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_4.id , user_id: normal_user1.id, listing_image: Faker::Company.logo)
listing_7 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_3.id , user_id: normal_user2.id, listing_image: Faker::Company.logo)
listing_8 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_4.id , user_id: normal_user2.id, listing_image: Faker::Company.logo)
listing_9 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_5.id , user_id: normal_user2.id, listing_image: Faker::Company.logo)
listing_10 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_4.id , user_id: normal_user3.id, listing_image: Faker::Company.logo)
listing_11 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_5.id , user_id: normal_user3.id, listing_image: Faker::Company.logo)
listing_12 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_6.id , user_id: normal_user3.id, listing_image: Faker::Company.logo)
listing_13 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_5.id , user_id: normal_user4.id, listing_image: Faker::Company.logo)
listing_14 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_6.id , user_id: normal_user4.id, listing_image: Faker::Company.logo)
listing_15 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_1.id , user_id: normal_user4.id, listing_image: Faker::Company.logo)
listing_16 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_6.id , user_id: normal_user5.id, listing_image: Faker::Company.logo)
listing_17 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_1.id , user_id: normal_user5.id, listing_image: Faker::Company.logo)
listing_18 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_2.id , user_id: normal_user5.id, listing_image: Faker::Company.logo)
listing_19 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_1.id , user_id: normal_user6.id, listing_image: Faker::Company.logo)
listing_20 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_2.id , user_id: normal_user6.id, listing_image: Faker::Company.logo)
listing_21 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_3.id , user_id: normal_user6.id, listing_image: Faker::Company.logo)
listing_22 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_2.id , user_id: normal_user7.id, listing_image: Faker::Company.logo)
listing_23 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_3.id , user_id: normal_user7.id, listing_image: Faker::Company.logo)
listing_24 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_4.id , user_id: normal_user7.id, listing_image: Faker::Company.logo)
listing_25 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_3.id , user_id: normal_user8.id, listing_image: Faker::Company.logo)
listing_26 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_4.id , user_id: normal_user8.id, listing_image: Faker::Company.logo)
listing_27 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_5.id , user_id: normal_user8.id, listing_image: Faker::Company.logo)
listing_28 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_4.id , user_id: normal_user9.id, listing_image: Faker::Company.logo)
listing_29 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_5.id , user_id: normal_user9.id, listing_image: Faker::Company.logo)
listing_30 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_6.id , user_id: normal_user9.id, listing_image: Faker::Company.logo)
listing_31 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_5.id , user_id: normal_user10.id, listing_image: Faker::Company.logo)
listing_32 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_6.id , user_id: normal_user10.id, listing_image: Faker::Company.logo)
listing_33 = Listing.create!(title: Faker::Commerce.product_name , description:Faker::Lorem.paragraph , budget: Faker::Number.number(5) , category_id: category_1.id , user_id: normal_user10.id, listing_image: Faker::Company.logo)



