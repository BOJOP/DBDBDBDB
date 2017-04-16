class ViewindivController < ApplicationController
	before_action :logged_in_personnel

  def new
  end


  def search
  	@search_result = Student.all
  	#@search_result = Student.find_by_sql("SELECT * FROM students INNER JOIN advisors ON advisors.student_id = students.id")
  	#@search_result = Student.joins(:advisors)
  	#puts @search_result.attribute_names
  	#puts Student.attribute_names

  	if !params[:searchinput][:id].nil? && !params[:searchinput][:id].blank?
  		@search_result = @search_result.where(id: params[:searchinput][:id])
  	end

  	if !params[:searchinput][:first_name].nil?  && !params[:searchinput][:first_name].blank?
  		@search_result = @search_result.where(first_name: params[:searchinput][:first_name])
  	end

  	if !params[:searchinput][:last_name].nil? && !params[:searchinput][:last_name].blank?
  		@search_result = @search_result.where(last_name: params[:searchinput][:last_name])
  	end

  	if !params[:searchinput][:advisor_id].nil? && !params[:searchinput][:advisor_id].blank?
  		@search_result = @search_result.joins(:advisors)
  	end

  	if !params[:searchinput][:status].nil? && !params[:searchinput][:status].blank?
  		@search_result = @search_result.where(status: params[:searchinput][:status])
  	end

  	#Finish Curriculum

  	if !params[:searchinput][:gpax_min].nil? && !params[:searchinput][:gpax_min].blank?
  		@Gpax = Gpa.find_by_sql("SELECT SUM(credit*gpa)/SUM(credit) as gpax, student_id FROM gpas GROUP BY student_id")
  		puts @Gpax.length
  		@Gpax.each do |row|
  			puts "Start"
  			puts row[:gpax], params[:searchinput][:gpax_min].to_i*100
  			if row[:gpax] < params[:searchinput][:gpax_min].to_i*100 && !@search_result.find_by(row[:student_id]).nil?
  				@search_result.find_by(row[:student_id]).delete()
  			end
  		end  		
  		#@search_result = @search_result.where(gpax_min: params[:searchinput][:gpax_min])
  	end
  	render 'new'
  end
end
