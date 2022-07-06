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

# Default user
user = User.find_by(id: 1)
user = User.create!(
  id: 1,
  email: "admin@example.com",
  password: "password123",
  first_name: "Test",
  last_name: "User'"
) if user.nil?
puts " * [OK] User (seed)"

# Default departments
i = 1
departments_array = ["Engineering", "QA", "Infrastructure", "Product Design"]
while i < 5 do
  department = Department.find_by(id: i)
  department = Department.create!(id: i,
                                  name: departments_array[i-1],
                                  division: "Technology",
                                  manager: Faker::Name.name) if department.nil?
  i+=1
end
puts " * [OK] Departments (seed)"

# Default sources
i = 1
while i < 4
  source = Source.find_by(id: i)
  source = Source.create!(id: i,
                          name: Faker::Company.name,
                          contact: Faker::Name.name,
                          contact_title: Faker::Job.title,
                          contact_phone: Faker::PhoneNumber.phone_number_with_country_code,
                          contact_email: Faker::Internet.email) if source.nil?
  i += 1
end
puts " * [OK] Sources (seed)"

# Default value streams
i = 1
while i < 5
  stream = Stream.find_by(id: i)
  stream = Stream.create!(id: i,
                          name: Faker::IndustrySegments.unique.industry,
                          stakeholder: Faker::Name.name,
                          stakeholder_email: Faker::Internet.email) if stream.nil?
  i += 1
end
puts " * [OK] Value Streams (seed)"

# Default projects
i = 1
while i < 5
  project = Project.find_by(id: i)
  project = Project.create!(id: i,
                            stream_id: i,
                            name: Faker::App.name,
                            internal: false,
                            start_date: Faker::Date.backward(days: i*10),
                            active: true) if project.nil?
  i += 1
end
puts " * [OK] Projects (seed)"

# Default roles
i = 1
while i < 9
  role = Role.find_by(id: 1)
  role = Role.create!(id: i,
                      name: Faker::Job.title,
                      shared: false,
                      administration: false) if role.nil?
  i += 1
end
puts " * [OK] Roles (seed)"

# Default currencies
i = 1
while i < 7
  currency = Currency.find_by(id: i)
  currency = Currency.create!(id: i,
                              symbol: Faker::Currency.code,
                              USDExchange: 1.2) if currency.nil?
  i += 1
end
puts " * [OK] Currencies (seed)"

# Share default credentials with the user
puts ""
puts "Default user credentials:"
puts "  Username: admin@example.com"
puts "  Password: password123"
