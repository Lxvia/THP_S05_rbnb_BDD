# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#city.delete_all
#listing.delete_all
#reservation.delete_all
#user.delete_all

10.times do |i|
    name = Faker::Name.name
    User.create!(
        name: name, 
        email: "#{name}#{i}@gmail.com",
        phone_number: "06#{Faker::PhoneNumber.subscriber_number(length: 80)}",
        decription: Faker::TvShows::MichaelScott.quote,  
        )
end

10.times do
    City.create!(
        city_name: Faker::Address.city,
        zip_code: Faker::Address.zip_code,
    )
end

50.times do 
    random_boolean = [true, false].sample
    Listing.create!(
        name: Faker::TvShows::FamilyGuy.location,
        available_beds: rand(1..6),
        price: rand(15..500),
        description: Faker::Lorem.paragraph(sentence_count: 5),
        has_wifi: random_boolean,
        city: City.all.sample,
    )
end

#past reservation
5.times do
    Reservation.create!(
        start_date: rand(2.years).ago,
        guest: Guest.all.sample,
        listing: Listing.all.sample,
    )
end

5.times do
    Reservation.create!(
        start_date: rand(1.years).from_now,
        guest: Guest.all.sample,
        listing: Listing.all.sample,
    )
end