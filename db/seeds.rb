# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#

(1..5).each_with_index do |i|
  Users::User.create(
    uid: i,
    first_name: "User #{i}",
    last_name: "Last name #{i}",
    email: "user-email-#{i}@example.org",
    phone_number: "66644411#{i}"
  )
end
