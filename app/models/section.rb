class Section < ApplicationRecord
  has_many :teaches
  has_many :personnels, :through => :teaches
	
	has_many :schedules
	has_many :time_slots, :through => :schedules
	
	has_many :enrollments, dependent: :destroy
	has_many :students, :through => :enrollments
	
  belongs_to :course
end
