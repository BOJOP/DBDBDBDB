class Enrollment < ApplicationRecord
	belongs_to :section
	belongs_to :student
	
	def getGrade
		if (!grade)
			return ''
		elsif (grade.floor == 0)
			return 'F'
		else
			return (69-grade.floor.to_i).chr.to_s + ((grade.floor!=grade) ? "+" : "")
		end
	end
end
