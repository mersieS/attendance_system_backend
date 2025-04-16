class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end


  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: "Öğrenci eklendi"
    else
      render :new
    end
  end

  def destroy
    @student = Student.destroy(params[:id])
  end

  private

  def student_params
    params.require(:student).permit(:name, :student_number, :photo)
  end
end
