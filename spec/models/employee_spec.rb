require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }
    it { should have_many(:ticket_employees)}
    it { should have_many(:tickets).through(:ticket_employees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:level)}
  end

  describe 'model methods' do
    it 'sorts ticket age oldest to youngest' do
      department_1 = Department.create!(name: "Sales", floor: 100 )
      department_2 = Department.create!(name: "Customer Service", floor: 75 )
      employee_1 = department_1.employees.create!(name: "Tyler", level: 27)
      employee_2 = department_1.employees.create!(name: "Tony", level: 17)
      employee_3 = department_2.employees.create!(name: "Tim", level: 7)
      ticket_1 = employee_1.tickets.create!(subject: "1MM SALE!", age: 1)
      ticket_2 = employee_1.tickets.create!(subject: "House", age: 2)
      ticket_3 = employee_1.tickets.create!(subject: "Business", age: 3)

      expect(employee_1.sort_tickets).to eq([ticket_3, ticket_2, ticket_1])
    end

    it 'gives the oldest ticket' do
      department_1 = Department.create!(name: "Sales", floor: 100 )
      department_2 = Department.create!(name: "Customer Service", floor: 75 )
      employee_1 = department_1.employees.create!(name: "Tyler", level: 27)
      employee_2 = department_1.employees.create!(name: "Tony", level: 17)
      employee_3 = department_2.employees.create!(name: "Tim", level: 7)
      ticket_1 = employee_1.tickets.create!(subject: "1MM SALE!", age: 1)
      ticket_2 = employee_1.tickets.create!(subject: "House", age: 2)
      ticket_3 = employee_1.tickets.create!(subject: "Business", age: 3)

      expect(employee_1.oldest_ticket).to eq("Business")

    end
  end
end
