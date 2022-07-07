# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
user.save
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
department.save
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
source.save
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
stream.save
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
project.save
puts " * [OK] Projects (seed)"

# Default roles
i = 1
while i < 9
  role = Role.find_by(id: i)
  role = Role.create!(id: i,
                      name: Faker::Job.title,
                      shared: false,
                      administration: false) if role.nil?
  i += 1
end
role.save
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
currency.save
puts " * [OK] Currencies (seed)"

# Default members
i = 1
while i < 11
  member = Member.find_by(id: i)
  member = Member.create!(id: i,
                          first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          role_id: Faker::Number.between(from:1, to:8),
                          department_id: Faker::Number.between(from:1, to: 4),
                          source_id: Faker::Number.between(from: 1, to: 3),
                          start_date: Faker::Date.backward(days: i * 30),
                          active: true) if member.nil?
  i += 1
end
member.save
puts " * [OK] Members (seed)"

# Default teams
i = 1
while i < 11
  team = Team.find_by(id: i)
  team = Team.create!(id: i,
                      member_id: i,
                      project_id: Faker::Number.between(from: 1, to: 4),
                      annual_rate: Faker::Number.between(from: 80000, to: 140000),
                      weekly_rate: Faker::Number.between(from: 1538, to: 2692),
                      currency_id: Faker::Number.between(from: 1, to: 6),
                      start_date: Date.today,
                      allocation: 100) if team.nil?
  i += 1
end
team.save
puts " * [OK] Teams (seed)"

# Share default credentials with the user
puts ""
puts "Default user credentials:"
puts "  Username: admin@example.com"
puts "  Password: password123"
