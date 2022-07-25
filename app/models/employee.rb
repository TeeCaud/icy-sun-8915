class Employee < ApplicationRecord
  belongs_to :department
  has_many :ticket_employees
  has_many :tickets, through: :ticket_employees

  validates_presence_of :name
  validates_presence_of :level

  def sort_tickets
    tickets.order(age: :desc)
  end

  def oldest_ticket
    sort_tickets.first.subject
  end
end
