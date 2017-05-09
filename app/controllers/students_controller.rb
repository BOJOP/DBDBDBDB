class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :save]
  before_action :logged_in_personnel

  # GET /students
  # GET /students.json
  def index
		@students = Student.all
		@curriculums = Curriculum.all
    respond_to do |format|
			format.html { render :index }
			format.json { render json: Oj.dump(@students) }
		end
  end

  def search

		@curriculums = Curriculum.all
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
  		@search_result = @search_result.joins(:advisors).where("advisors.personnel_id = #{params[:searchinput][:advisor_id]}")
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

  	render 'index'
	end

  # GET /students/1
  # GET /students/1.json
  def show
    #puts "Update All"
    @student.updateData

    @colorList = [
        '#f44336',
        '#ff5722',
        '#ff9800',
        '#ffc107',
        '#ffeb3b',
        '#cddc39',
        '#8bc34a',
        '#4caf50',
        '#009688',
        '#00bcd4',
        '#03a9f4',
        '#2196f3'
    ]
    @gradeAlphabet = {4.0 => 'A', 3.5 => 'B+', 3.0 => 'B', 2.5 => 'C+', 2.0 => 'C', 1.5 => 'D+', 1.0 => 'D', 0.0 => 'F', -1.0 => 'W', -2.0 => 'I'}

    @advisor_name_arr = Array.new
    @advisor = Advisor.where(student_id: @student.id)
    @advisor.each do |adv|
      x = Personnel.find_by(id: adv.personnel_id)
      @advisor_name_arr.push(x)
    end

    #Academic Info
    @gpa = Gpa.where(student_id:@student.id).order(year: :desc, semester: :desc)
    @gpax = Gpa.find_by_sql("SELECT SUM(credit*gpa)/SUM(credit) as gpax
            FROM gpas WHERE student_id = \'"+params[:id]+"\'
            HAVING SUM(credit) > 0")

    if @gpax.first.nil?
      @gpax = [{gpax: 0.0}]
    end

    #Group Info
    @in_group = BelongTo.select(:group_id).where(student_id: @student.id)

    #Leave Info
    @personal_leave_arr = Array.new
    @sick_leave_arr = Array.new

    @in_group.each do |group|
      @leave = Leave.where(group_id: group.group_id).order(start_date: :desc)
      @leave.each do |leave|
        personal_leave = PersonalLeave.where(leave_id:leave.id).first
        sick_leave = SickLeave.where(leave_id:leave.id).first
        if !personal_leave.nil?
          @personal_leave_arr.push([leave, personal_leave])
        else
          @sick_leave_arr.push([leave, sick_leave])
        end
      end
    end

    #Event
    @competition_event_arr = Array.new
    @activity_event_arr = Array.new

    @in_group.each do |group|
      @activity = Event.find_by_sql("
                                SELECT *
                                FROM events INNER JOIN participates
                                ON participates.event_id = events.id
                                WHERE participates.group_id = \'#{group.group_id}\'
                                ORDER BY events.date DESC")
      @activity.each do |act|
        @activity_event_arr.push(act)
      end

      @competition = Event.find_by_sql("
                                SELECT *
                                FROM events INNER JOIN competes
                                ON competes.event_id = events.id
                                WHERE competes.group_id = \'#{group.group_id}\'
                                ORDER BY events.date DESC")
      @competition.each do |act|
        @competition_event_arr.push(act)
      end
    end

    #LogBreak
    @breaking_arr = Array.new
    @breaking = LogBreak.where(student_id: @student.id)
    @breaking.each do |_break|
      rule = Rule.find_by(id: _break.rule_id)
      @breaking_arr.push([_break, rule])
    end

    #Curriculum
    @required_subject = Require.where(curriculum_id: @student.curriculum_id).order(:course_id)
    @required_subject_arr = Array.new
    @required_subject.each do |subject|
      subject_detail = Course.find_by(id: subject.course_id)
      #puts "Require: "+ subject.course_id.to_s
      @required_subject_arr.push([subject, subject_detail])
    end



    @enrolled_course = Enrollment
              .joins("INNER JOIN sections ON enrollments.section_id = sections.id")
              .select("sections.course_id as course_id, enrollments.grade as grade, enrollments.student_id as student_id")
              .where("enrollments.student_id = \'#{@student.id}\' and enrollments.grade > 0")
              .order("sections.course_id")


    @temp = Enrollment
              .select("*")
              .where("enrollments.student_id = \'#{@student.id}\'")


    @required_subject_arr.each do |subject|
      @enrolled_course.where("course_id = #{subject[1].id}").first.nil?
    end

    @enrollment_arr = Enrollment
              .joins("INNER JOIN sections ON enrollments.section_id = sections.id")
              .select("sections.*, enrollments.grade as grade")
              .where("enrollments.student_id = \'#{@student.id}\'")
              .order("sections.year desc, sections.semester desc")


    @sum_score_reduced = 0
    @breaking_arr.each do |_break|
      @sum_score_reduced += _break[1].behavior_score_reduction
    end

    respond_to do |format|
      format.html { render :show }
      format.json { render json: Oj.dump(@student) }
    end


  end

  def save


    #Academic Info
    @gpa = Gpa.where(student_id:@student.id)
    @gpax = Gpa.find_by_sql("SELECT SUM(credit*gpa)/SUM(credit) as gpax FROM gpas WHERE student_id = \'"+"5731002421"+"\'")

    #Group Info
    @in_group = BelongTo.where(student_id: @student.id)

    #Leave Info
    @personal_leave_arr = Array.new
    @sick_leave_arr = Array.new

    @in_group.each do |group|
      @leave = Leave.where(group_id: group.id).order(start_date: :desc)

      @leave.each do |leave|
        personal_leave = PersonalLeave.where(leave_id:leave.id).first
        sick_leave = SickLeave.where(leave_id:leave.id).first

        if !personal_leave.nil?
          @personal_leave_arr.push([leave, personal_leave])
        else
          @sick_leave_arr.push([leave, sick_leave])
        end
      end
    end

    render  pdf: 'filename.pdf',
            template: 'students/show.pdf.erb',
            page_size: 'A4',
            margin: {
              :top => 40
            },
            header:  {
              spacing: 10,
              html: {
                template: 'layouts/header.pdf.erb',
              },
            }
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
		@curriculums = Curriculum.all
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    @student.status = "Studying"

    if ( params[:date] && params[:date] != "" )
      @date = params[:date].split('-')
      @student.birth_date = Date.new(@date[0].to_i,@date[1].to_i,@date[2].to_i)
    end

    if ( params[:curriculum] && params[:curriculum].split(' | ')[1])
      @curriculum = Curriculum.where(name: params[:curriculum].split(' | ')[1])[0]
      @student.curriculum_id = @curriculum.id
    end

    @student.updateData

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { redirect_to students_url, notice: @student.errors }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @student_params = student_params

    if ( params[:date] && params[:date] != "" )
      @date = params[:date].split('-')
      @student_params.birth_date = Date.new(@date[0].to_i,@date[1].to_i,@date[2].to_i)
    end

    if ( params[:curriculum] && params[:curriculum].split(' | ')[1])
      @curriculum = Curriculum.where(name: params[:curriculum].split(' | ')[1])[0]
      @student_params.curriculum_id = @curriculum.id
    end

    respond_to do |format|
      if @student.update(@student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { redirect_to students_url, notice: @student.errors }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.fetch(:student, {}).permit(:first_name,:last_name,:email,:ssn,:gender,:picture,:id,:enroll_year)
    end
end
