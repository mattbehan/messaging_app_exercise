# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@doctor1 = CareManager.create(email: "mattbehan@gmail.com", password: "password")

@patient1 = Patient.create(email: "mattbehan1@gmail.com", password: "password")
@patient2 = Patient.create(email: "mattbehan2@gmail.com", password: "password")
@patient3 = Patient.create(email: "mattbehan3@gmail.com", password: "password")
@patient4 = Patient.create(email: "mattbehan4@gmail.com", password: "password")