# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
admin_user = User.create!(first_name: 'sadiq', last_name: 'okocha', address: '8 alhaji kanike close', phone_number: '07534092880', email: "admin@specialist.com", password: 'password', role: "admin")

normal_user1 = User.create!(first_name: 'james', last_name: 'fajimolu', address: '12 sanusfi fafunwa',email: "user@specialist.com", password: 'password', role: "user" )

normal_user2 = User.create!(first_name: 'chudi', last_name: 'ngonadi', address: '33 alfred rewane',email: "user1@specialist.com", password: 'password', role: "user")