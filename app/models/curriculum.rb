class Curriculum < ApplicationRecord
  has_many :students
  has_many :gpas, :through => :students
	
	belongs_to :department
end
