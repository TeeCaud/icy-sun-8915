class Ticket < ApplicationRecord
  has_many :ticket_employees
  has_many :employees, through: :ticket_employees

  validates_presence_of(:subject)
  validates_presence_of(:age)
end
