module Api
  class AttendancesController < ApplicationController
    protect_from_forgery with: :null_session

    def create
      student = Student.find_by(name: params[:student_name])

      unless student
        render json: { error: "Student Not Found!" }, status: :not_found
        returnq
      end

      attendance = StudentAttendance.create(
        student: student,
        date: params[:attended_at],
        status: params[:status],
      )

      if attendance.persisted?
        render json: { message: "Attended will successfull" }, status: :created
      else
        render json: { error: attendance.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
