class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
    @tickets = @employee.tickets
  end
end