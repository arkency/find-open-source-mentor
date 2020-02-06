# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

default_password = '12345678'

User::ROLES.each do |role_name|
  user_attributes = {
    email: "user_#{role_name}@example.com",
    password: default_password,
    role: role_name
  }
  user = User.create!(user_attributes)
  puts 'Created user: ' + user.email
end