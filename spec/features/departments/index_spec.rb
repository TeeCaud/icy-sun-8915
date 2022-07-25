require 'rails_helper'

RSpec.describe 'department index page' do
  describe 'when i visit the page' do
    it 'shows departments attributes, and name of its employees' do
      department_1 = Department.create!(name: "Sales", floor: 100 )
      department_2 = Department.create!(name: "Customer Service", floor: 75 )
      employee_1 = department_1.employees.create!(name: "Tyler", level: 27)
      employee_2 = department_1.employees.create!(name: "Tony", level: 17)
      employee_3 = department_2.employees.create!(name: "Tim", level: 7)

      visit "/departments"

      expect(current_path).to eq("/departments")
      expect(page).to have_content("Sales")
      expect(page).to have_content(100)
      expect(page).to have_content("Tyler")
      expect(page).to have_content("Tony")
      expect(page).to have_content("Tim")
      expect(page).to_not have_content("Adam")
    end
  end
end
