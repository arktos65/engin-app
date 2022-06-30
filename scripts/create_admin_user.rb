# Use this script to create the default admin user for the app
# Use this ONLY in your development environment.  It should never be used in production.
User.create(email: "admin@example.com", password: "password", first_name: "Admin", last_name: "User")
