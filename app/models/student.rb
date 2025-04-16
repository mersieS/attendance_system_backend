class Student < ApplicationRecord
  validates :student_number, presence: true, uniqueness: true
  validates :name, presence: true  

  has_one_attached :photo
  has_many :student_attendances, dependent: :destroy

  before_save :capitalize_name

  private

  def capitalize_name
    self.name = name.split.map(&:capitalize).join(' ') if name.present?
  end
end
