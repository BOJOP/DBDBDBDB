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

	def gpax

		@gpax = Gpa.find_by_sql("SELECT SUM(credit*gpa)/SUM(credit) as gpax FROM gpas WHERE student_id = '" + self.id + "'")
		@gpax.first.gpax.round(2)
	end
end
