# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Category.delete_all

admin_user = User.create!(first_name: 'Sadiq', last_name: 'Okocha', address: '8 alhaji kanike close', phone_number: '07534092880', email: "admin@specialist.com", password: 'password', role: "admin")

normal_user1 = User.create!(first_name: 'James', last_name: 'fajimolu', address: '12 sanusfi fafunwa',phone_number: '08188699925',email: "user@specialist.com", password: 'password', role: "user" )

normal_user2 = User.create!(first_name: 'Chudi', last_name: 'Ngonadi', address: '33 alfred rewane',phone_number: '07458720993', email: "user1@specialist.com", password: 'password', role: "user")

category_1 = Category.create!(name: 'Plumber')
category_2 = Category.create!(name: 'Carpenter')
category_3 = Category.create!(name: 'Crafts')
category_4 = Category.create!(name: 'Painter')
category_5 = Category.create!(name: 'Electrician')
category_6 = Category.create!(name: 'Engineer')