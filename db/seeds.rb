# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

paul, alia, leto = User.create([
  {name: 'Paul Atreides',  email: 'paul@arrakis.com', password: 'ironhack', password_confirmation: 'ironhack', about: "I'm the best chef on earth"},
  {name: 'Alia Atreides',  email: 'alia@arrakis.com',  password: 'ironhack', password_confirmation: 'ironhack', about: "I'm good at playing tennis"},
  {name: 'Leto Atreides', email: 'leto@arrakis.com',  password: 'ironhack', password_confirmation: 'ironhack', about: "I speak English well"}
])
