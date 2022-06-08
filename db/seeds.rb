# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#

require "open-uri"


Rental.destroy_all
Rating.destroy_all
Ad.destroy_all
User.destroy_all

user = User.create(email: "phi@gmail.com", first_name: "phil", last_name: "bur", phone_number: "0000000000", password: "password")


file = URI.open('https://cdn.shopify.com/s/files/1/0073/9046/2036/products/sq1-thumbnail.blue-a512_1440x.png')
ad = Ad.new(
  title: 'Annonce test', location: 'Marseille', color: 'Pink',
  cable_length: 100, brand: 'Belkino', number_of_plug: 6, user: user, description: "dskjvndfjkh  zifghfe ije kjgh dkjdkkj jkj erghjdf jk hvdfkjfgb kjgdbkjnb kjh kh ekdghbv kjdhfg kh "
)
ad.photo.attach(io: file, filename: 'multi.png', content_type: 'image/png')
p ad.photo.attached?
ad.save

#Rating.create(user_id: user.id, ad_id: ad.id, rate: 3, comment: "Parfait")
