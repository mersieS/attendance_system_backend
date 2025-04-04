class Student < ApplicationRecord
  validates :student_number, presence: { message: "Öğrenci numarası zorunludur." }, uniqueness: { message: "Bu öğrenci numarası zaten kullanılıyor." }
  validates :name, presence: { message: "Ad ve Soyad zorunludur." }
  has_one_attached :photo
  has_many :student_attendances, dependent: :destroy
end
