# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

department_1 = Department.create!(name: "Sales", floor: 100 )
department_2 = Department.create!(name: "Customer Service", floor: 75 )
employee_1 = department_1.employees.create!(name: "Tyler", level: 27)
employee_2 = department_1.employees.create!(name: "Tony", level: 17)
employee_3 = department_2.employees.create!(name: "Tim", level: 7)
ticket_1 = employee_1.tickets.create!(subject: "1MM SALE!", age: 1)
ticket_2 = employee_1.tickets.create!(subject: "House", age: 2)
ticket_3 = employee_1.tickets.create!(subject: "Business", age: 3)
