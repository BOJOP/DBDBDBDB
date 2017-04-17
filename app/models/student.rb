class Student < ApplicationRecord
	has_many :advisors
	has_many :personnels, :through => :advisors

	has_many :gpas
	belongs_to :curriculum
end
