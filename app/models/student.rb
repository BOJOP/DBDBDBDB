class Student < ApplicationRecord
	has_many :advisors
	has_many :personnels, :through => :advisors

	has_many :gpas
	belongs_to :curriculum

	#Unfinished
	def update_grade
		@grade_table = Array.new

	    @section_enrolled = Enrollment.where(student_id: self.id)
	    @section_enrolled.each do |enrollment|
	        section_detail = Section.find_by(id: enrollment.section_id)
	        section_detail = Course.find_by(id: enrollment.course_id)
	    end
	end

	def getGpax
		@Gpax = Gpa.find_by_sql("SELECT SUM(credit*gpa)/SUM(credit) as gpax, student_id FROM gpas GROUP BY student_id")
		@Gpax.each do |row|

  			if row.student_id == self.id
  				return row.gpax
  			end
  		end
	end
end
