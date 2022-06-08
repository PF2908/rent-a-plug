# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
Rental.destroy_all
Rating.destroy_all
Ad.destroy_all
User.destroy_all

user = User.create(email: "phi@gmail.com", first_name: "phil", last_name: "bur", phone_number: "0000000000", password: "password")

ad = Ad.create(
  title: 'Annonce test', location: 'Marseille', color: 'Pink',
  cable_length: 100, brand: 'Belkino', number_of_plug: 6, user: user
)

Rating.create(user_id: user.id, ad_id: ad.id, rate: 3, comment: "Parfait")
