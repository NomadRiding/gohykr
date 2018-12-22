# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!( email: "test@email.com",
                    password: "password",
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name
                  )
5.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "password",
    username:Faker::Internet.unique.username(5..10),
    gender:Faker::Gender.binary_type,
    rating: Faker::Number.between(1, 5),
    bio: Faker::Lorem.paragraphs(1),
    )
    user.save(validate: false)

    2.times do
      it = Itinerary.create!(
        # origin: Faker::Address.full_address,
        start_date: Faker::Date.forward((1..3).to_a.sample).iso8601,
        # destination: Faker::Address.full_address,
        end_date: Faker::Date.forward((3..23).to_a.sample).iso8601,
        available_seat: Faker::Number.between(1, 7),
        description: [Faker::VForVendetta.quote, Faker::WorldOfWarcraft.quote, Faker::PrincessBride.quote, Faker::Movie.quote].sample,
        user: user,
      )
      it.location.create( address: "Miami, FL", is_origin: true)
      it.location.create( address: "Tampa, FL", is_origin: false)
    end
end


