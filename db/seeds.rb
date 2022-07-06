# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# app = Doorkeeper::Application.create! :name => "Barrique API",
#                                       :redirect_uri => "https://localhost:3000/callback"
#
# puts "Application: "
# puts "name: #{app.name}"
# puts "redirect_uri: #{app.redirect_uri}"
# puts "uid: #{app.uid}"
# puts "secret: #{app.secret}"
#
puts "Task->Seeding database:"

puts " * [..] User (seed)"
user = User.find_by(id: 1)
user = User.create!(
  id: 1,
  email: "admin@example.com",
  password: "password123",
  first_name: "Test",
  last_name: "User'"
) if user.nil?
puts " * [OK] User (seed)"
puts ""
puts "Default user credentials:"
puts "  Username: admin@example.com"
puts "  Password: password123"
