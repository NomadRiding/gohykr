# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
  User.create([{
    email: Faker::Name.name
    first_name: Faker::Name.first_name
    last_name: Faker::Name.last_name
    password_digest: Faker::Number.number(5)
    username:Faker::Name.name
    gender:Faker::Gender.binary_type
    rating: Faker::Number.between(1, 5)
    bio: Faker::Lorem.paragraphs(1)
    }])
end
