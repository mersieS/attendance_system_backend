class StudentAttendancesController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @student_attendances = @student.student_attendances.order(date: :desc)
  end
end
