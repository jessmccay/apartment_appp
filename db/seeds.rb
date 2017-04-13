# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mrin = User.new(email: "mrinalinisinha05@gmail.com", password: "password")
Apartment.new(street_1: '243 Harman Street, Brooklyn NY 11237', user_id: mrin.id, name: "Bushwick Beauty")
