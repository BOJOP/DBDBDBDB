class Curriculum < ApplicationRecord
  has_many :students, dependent: :nullify
  has_many :gpas, :through => :students
	
	belongs_to :department
end
