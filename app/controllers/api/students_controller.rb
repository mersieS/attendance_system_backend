module Api
  class StudentsController < ApplicationController
    include Rails.application.routes.url_helpers

    def index
      students = Student.all.map do |s|
        {
          id: s.id,
          name: s.name,
          student_number: s.student_number,
          photo_url: s.photo.attached? ? url_for(s.photo) : nil
        }
      end

      render json: students
    end
  end
end
