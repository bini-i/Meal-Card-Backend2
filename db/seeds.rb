# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Employee.destroy_all

# Employee.create!([
#     {
#         first_name: "abel",
#         father_name: "f",
#         last_name: "l",
#         department_id: 1,
#         remaining: 10,
#         employee_id: 291
#     },
#     {
#         first_name: "biruk",
#         father_name: "f",
#         last_name: "l",
#         department_id: 1,
#         remaining: 0,
#         employee_id: 292
#     },
#     {
#         first_name: "daniel",
#         father_name: "f",
#         last_name: "l",
#         department_id: 2,
#         remaining: 1,
#         employee_id: 293
#     },
#     {
#         first_name: "ephrem",
#         father_name: "f",
#         last_name: "l",
#         department_id: 2,
#         remaining: 3,
#         employee_id: 294
#     },
# ])

# p "Created #{Employee.count} employees"

# User.destroy_all

# User.create!([
#     {
#         username: "abebe",
#         password: "123456"
#     },
#     {
#         username: "blen",
#         password: "123456"
#     }
# ])

# p "Created #{User.count} users"


require_relative './department_seeding'

require_relative './employee_seeding'

puts "Seeding deparments..."

seed_departments

puts "Seeding departments done."

puts "Seeding employees"

seed_employees

puts " Seeding employees done"
