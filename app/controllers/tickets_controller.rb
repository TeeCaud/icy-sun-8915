class TicketsController < ApplicationController


  def create
    ticket = Ticket.create!(ticket_params)
    binding.pry
    employee = Employee.find(params[:id])
    if ticket.save
      redirect_to "employees/#{employee.id}"
    end
  end

private
  def ticket_params
    params.permit(:subject, :age)
  end

end
