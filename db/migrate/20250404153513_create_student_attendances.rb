class CreateStudentAttendances < ActiveRecord::Migration[8.0]
  def change
    create_table :student_attendances do |t|
      t.references :student, null: false, foreign_key: true
      t.date :date
      t.boolean :status

      t.timestamps
    end
  end
end
