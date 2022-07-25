require 'rails_helper'

RSpec.describe 'employee show page' do
  describe 'when i visit the the show page' do
    it 'shows employees name and department' do
      department_1 = Department.create!(name: "Sales", floor: 100 )
      department_2 = Department.create!(name: "Customer Service", floor: 75 )
      employee_1 = department_1.employees.create!(name: "Tyler", level: 27)
      employee_2 = department_1.employees.create!(name: "Tony", level: 17)
      employee_3 = department_2.employees.create!(name: "Tim", level: 7)

      visit "/employees/#{employee_1.id}"

      expect(current_path).to eq("/employees/#{employee_1.id}")
      expect(page).to have_content("Tyler")
      expect(page).to have_content("Sales")
    end

    it 'shows a list of their tickets from oldest to youngest' do
      department_1 = Department.create!(name: "Sales", floor: 100 )
      department_2 = Department.create!(name: "Customer Service", floor: 75 )
      employee_1 = department_1.employees.create!(name: "Tyler", level: 27)
      employee_2 = department_1.employees.create!(name: "Tony", level: 17)
      employee_3 = department_2.employees.create!(name: "Tim", level: 7)
      ticket_1 = employee_1.tickets.create!(subject: "1MM SALE!", age: 1)
      ticket_2 = employee_1.tickets.create!(subject: "House", age: 2)
      ticket_3 = employee_1.tickets.create!(subject: "Business", age: 3)

      visit "/employees/#{employee_1.id}"

      # save_and_open_page

      expect(current_path).to eq("/employees/#{employee_1.id}")
      expect(page).to have_content("1MM SALE!")
      expect(page).to have_content("House")
      expect(page).to have_content("Business")
      expect(page).to_not have_content("Auto")

      within '#ticket-0' do
        expect(page).to have_content("Business")
      end
      within '#ticket-1' do
        expect(page).to have_content("House")
      end
      within '#ticket-2' do
        expect(page).to have_content("1MM SALE!")
      end
    end

    it 'shows the oldest ticket' do
      department_1 = Department.create!(name: "Sales", floor: 100 )
      department_2 = Department.create!(name: "Customer Service", floor: 75 )
      employee_1 = department_1.employees.create!(name: "Tyler", level: 27)
      employee_2 = department_1.employees.create!(name: "Tony", level: 17)
      employee_3 = department_2.employees.create!(name: "Tim", level: 7)
      ticket_1 = employee_1.tickets.create!(subject: "1MM SALE!", age: 1)
      ticket_2 = employee_1.tickets.create!(subject: "House", age: 2)
      ticket_3 = employee_1.tickets.create!(subject: "Business", age: 3)

      visit "/employees/#{employee_1.id}"

      expect(current_path).to eq("/employees/#{employee_1.id}")
      expect(page).to have_content("Oldest Ticket: Business")
    end

    it 'has a form to assign ticket to employee' do
      department_1 = Department.create!(name: "Sales", floor: 100 )
      department_2 = Department.create!(name: "Customer Service", floor: 75 )
      employee_1 = department_1.employees.create!(name: "Tyler", level: 27)
      employee_2 = department_1.employees.create!(name: "Tony", level: 17)
      employee_3 = department_2.employees.create!(name: "Tim", level: 7)
      ticket_1 = employee_1.tickets.create!(subject: "1MM SALE!", age: 1)
      ticket_2 = employee_1.tickets.create!(subject: "House", age: 2)
      ticket_3 = employee_2.tickets.create!(subject: "Business", age: 3)

      visit "/employees/#{employee_1.id}"
# save_and_open_page
      expect(current_path).to eq("/employees/#{employee_1.id}")
      expect(page).to_not have_content("Business")
      expect(page).to have_content("House")

      fill_in 'Subject', with: "Car"
      fill_in 'Age', with: 4
      click_on "Save"

      expect(current_path).to eq("/employees/#{employee_1.id}")
      expect(page).to have_content("Car")
    end
  end
end
