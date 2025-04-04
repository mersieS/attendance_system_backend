class AddUniqnessStudentNumber < ActiveRecord::Migration[8.0]
  def change
    add_index :students, :student_number, unique: true
  end
end