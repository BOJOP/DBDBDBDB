class Student < ApplicationRecord
	has_many :advisors
	belongs_to :curriculum
end
