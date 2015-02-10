# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Category.delete_all
Listing.delete_all

admin_user = User.create!(first_name: 'Sadiq', last_name: 'Okocha', address: '8 alhaji kanike close', phone_number: '07534092880', email: "admin@specialist.com", password: 'password', role: "admin", avatar: 'http://organicthemes.com/demo/profile/files/2012/12/profile_img.png')

normal_user1 = User.create!(first_name: 'James', last_name: 'fajimolu', address: '12 sanusfi fafunwa',phone_number: '08188699925',email: "user@specialist.com", password: 'password', role: "user", avatar: 'http://www.realtimearts.net/data/images/art/46/4640_profile_nilssonpolias.jpg' )

normal_user2 = User.create!(first_name: 'Chudi', last_name: 'Ngonadi', address: '33 alfred rewane',phone_number: '07458720993', email: "user1@specialist.com", password: 'password', role: "user", avatar: 'http://dev.sol-technology.com.au/QUT/images/profile/tempProfile1.jpg')

contractor_admin = Contractor.create!(user_id: admin_user.id, wage: 235)
contractor_1 = Contractor.create!(user_id: normal_user1.id, wage: 2114)
contractor_2 = Contractor.create!(user_id: normal_user2.id, wage: 2114)

category_1 = Category.create!(name: 'Plumber')
category_2 = Category.create!(name: 'Carpenter')
category_3 = Category.create!(name: 'Crafts')
category_4 = Category.create!(name: 'Painter')
category_5 = Category.create!(name: 'Electrician')
category_6 = Category.create!(name: 'Engineer')

listing1 = Listing.create!(title: 'leaky pipes', budget: 14550 , description:"The pipes in my apartment have leaked and now my apartment has turned into a swimming pool. My carpet is damaged, so i need someone over here asap. Please come sooooooooon!" , image: 'http://www.propertyrepair.ie/uploads/9/2/2/6/9226934/934581_orig.jpg' , user_id: User.last.id, category_id: 1)

listing2 = Listing.create!(title: 'broken chair', budget: 5000, description: "Goldilocks broke my chair and now I have not chair to sit in. Damn Goldilocks always doing shit, she's not supposed to do. Good thing I have chair insurance" , image: 'http://fc05.deviantart.net/fs41/i/2009/023/d/0/Item_1__Broken_Chair_by_MystStock.jpg', user_id:User.first.id, category_id:2 )
listing3 = Listing.create!(title: 'chipping paint', budget: 2300  , description: "My car needs a new coat of paint. It must be all the acid. And by acid i mean LSD. ya feel me?! Jk my car just needs a new coat of paint. I'm free anytime you are. Willing to drop off the car.", image: 'http://static.panoramio.com/photos/large/40574409.jpg' , user_id: User.last.id, category_id: 4)

listing4 = Listing.create!(title: 'broken down car engine', budget: 500000 , description: "My sweet new ride has broken down. I think someone filled it up with water instead of premium PMS. What am I supposed to do now?" , image: 'http://thecheapestcarstoinsure.co.uk/wp-content/uploads/2014/08/old-broken-down-car.jpg' , user_id: User.first(2).last.id, category_id:6)

listing5 = Listing.create!(title: 'crossed wires', budget: 4200 , description: "All the power in my house has gone out. Not sure what exactly the problem is, but be careful because prior to the blackout, it gave quite a shock!" , image: 'http://i1.trekearth.com/photos/7604/wired1.jpg', user_id: User.first.id, category_id: 5)


