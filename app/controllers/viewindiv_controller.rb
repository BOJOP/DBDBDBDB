class ViewindivController < ApplicationController
	before_action :logged_in_personnel

  def new
  end


  def search
#    puts "Update All"
#    Student.all.each do |std|
#      std.updateData
#    end

  	@search_result = Student.all

		@params = params[:searchinput];

  	if !params[:searchinput][:id].nil? && !params[:searchinput][:id].blank?
  		@search_result = @search_result.where("id LIKE :prefix", prefix: "#{params[:searchinput][:id]}%")
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

    if !params[:searchinput][:year].nil? && !params[:searchinput][:year].blank?
      @search_result = @search_result.where(enroll_year: (DateTime.now.year - params[:searchinput][:year].to_i))
    end

  	#Finish Curriculum
    if !(params[:searchinput][:gpax_min] == '2' and params[:searchinput][:gpax_max] == '2')
      temp = @search_result
      @search_result = []
    	if !params[:searchinput][:gpax_min].nil? && !params[:searchinput][:gpax_min].blank?

    		@Gpax = Gpa.find_by_sql("SELECT CASE WHEN SUM(credit)=0 then 0 ELSE SUM(credit*gpa)/SUM(credit) END as gpax, student_id FROM gpas GROUP BY student_id")
    		@Gpax.each do |row|

    			if row[:gpax] >= params[:searchinput][:gpax_min].to_f and row[:gpax] <= params[:searchinput][:gpax_max].to_f
            temp2 = temp.find_by(id: row[:student_id])
            @search_result.push(temp2) if !temp2.nil?
    			end
    		end
    	end

    end

  	render 'new'
  end
end
