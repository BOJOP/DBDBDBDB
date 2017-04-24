class Student < ApplicationRecord
	has_many :advisors
	has_many :belong_tos
	has_many :groups, :through => :belong_tos
	has_many :personnels, :through => :advisors

	has_many :gpas
	belongs_to :curriculum

	#Unfinished
	def update_grade
		@grade_table = Array.new

	    @section_enrolled = Enrollment.where(student_id: self.id).where.not(grade: nil).order(:section_id)

	    @section_enrolled.each do |enrollment|
	        section_detail = Section.find_by(id: enrollment.section_id)
	        course_detail = Course.find_by(id: section_detail.course_id)
	        @grade_table.push([enrollment, section_detail, course_detail]) # Enrollment, Section, Course
	    end

	    gradeFRecord = Hash.new
	    @grade = Gpa.where(student_id: self.id)
	    @grade.each do |grade|
	    	sum = 0
	    	credit = 0
	    	@grade_table.each do |table|
	    		#puts table[1].year.to_s + " " + table[1].semester.to_s + " " + table[0].grade.to_s
	    		if table[1].year == grade.year &&
	    			table[1].semester == grade.semester
	    			#puts table[0].grade
	    				if table[0].grade > 0
	    					if !gradeFRecord[table[2].id].nil?
		    					sum += table[2].credit * table[0].grade / (gradeFRecord[table[2].id]+1)
		    					credit += table[2].credit
		    					gradeFRecord[table[2].id] = nil
		    				else
		    					sum += table[2].credit * table[0].grade
		    					credit += table[2].credit
		    				end
		    			else
		    				if table[0].grade == 0
		    					if gradeFRecord[table[2].id].nil?
		    						gradeFRecord[table[2].id] = 1
		    					else
		    						gradeFRecord[table[2].id] += 1
		    					end
		    				end
		    			end
	    		end
	    	end
	    	#puts sum.to_s + " " + credit.to_s
	    	if credit != 0
	    		grade.gpa = sum/credit
	    		grade.credit = credit
	    	else
	    		grade.gpa = 0
	    		grade.credit = 0
	    	end
	    	grade.save
	    end
	end

	#Unfinished
	def updateGraduation

		#Curriculum
	    @required_subject = Require.where(curriculum_id: self.curriculum_id).order(:course_id)
	    @required_subject_arr = Array.new

	    @required_subject.each do |subject|
	      subject_detail = Course.find_by(id: subject.course_id)
	      @required_subject_arr.push([subject, subject_detail])
	    end

   		@enrolled_course = Enrollment
              .joins("INNER JOIN sections ON enrollments.section_id = sections.id")
              .select("sections.course_id as course_id, enrollments.grade as grade, enrollments.student_id as student_id")
            	.where("enrollments.student_id = \'#{self.id}\' and not grade = 0")
              .order("enrollments.student_id")

	    @required_subject_arr.each do |subject|
    		if @enrolled_course.where("course_id = #{subject[1].id}").first.nil?
    			#puts self.id + " return " + subject[1].id.to_s
    			return
    		end
    	end
    	if self.status == "Studying"
    		self.status = "Graduated"
    	end
    	self.save
    	return
	end

	def updateData
		update_grade
		updateGraduation
	end

	def gpax

		@gpax = Gpa.find_by_sql("SELECT SUM(credit*gpa)/SUM(credit) as gpax FROM gpas WHERE student_id = '" + self.id + "'")
		@gpax.first.gpax.round(2)
	end
end
