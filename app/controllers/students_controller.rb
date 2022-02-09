class StudentsController < ApplicationController

  def index
    if params[:name]
      students = Student.where(first_name: params[:name].titleize) 
        .or(Student.where(last_name: params[:name].titleize))
      render json: students
    else
      students = Student.all
      render json: students
    end
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
