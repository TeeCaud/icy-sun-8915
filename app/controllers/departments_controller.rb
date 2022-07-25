class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
    # department = Department.find(params[:id])
    # binding.pry
  end
end
