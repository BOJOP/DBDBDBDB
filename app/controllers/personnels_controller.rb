class PersonnelsController < ApplicationController

  before_action :set_personnel, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_personnel

  # GET /personnels
  # GET /personnels.json
  def index
    @personnels = Personnel.all
    @departments = Department.all

		respond_to do |format|
			format.html { render :index }
			format.json { render json: Oj.dump(@personnels.select([:id, :first_name, :last_name, :email, :gender])) }
		end
  end

  # GET /personnels/1
  # GET /personnels/1.json
  def show

    #Get all student in advisors
    @students = @personnel.students;

    @workin = if @personnel.workin_department_id.nil? then "" else @personnel.workin_department_id.name end
    @manage = if @personnel.manage_department_id.nil? then "" else @personnel.manage_department_id.name end


    #
    # #Academic Info
    # @gpa = Gpa.where(student_id:@student.id)
    # @gpax = Gpa.find_by_sql("SELECT SUM(credit*gpa)/SUM(credit) as gpax FROM gpas WHERE student_id = \'"+params[:id]+"\'")
    #
    # #Group Info
    # @in_group = BelongTo.where(student_id: @student.id)
    #
    # #Leave Info
    # @personal_leave_arr = Array.new
    # @sick_leave_arr = Array.new
    #
    # @in_group.each do |group|
    #   @leave = Leave.where(group_id: group.id).order(start_date: :desc)
    #   @leave.each do |leave|
    #     personal_leave = PersonalLeave.where(leave_id:leave.id).first
    #     sick_leave = SickLeave.where(leave_id:leave.id).first
    #     if !personal_leave.nil?
    #       @personal_leave_arr.push([leave, personal_leave])
    #     else
    #       @sick_leave_arr.push([leave, sick_leave])
    #     end
    #   end
    # end
    #
    # #Portfolio
    # @competition_portfolio_arr = Array.new
    # @activity_portfolio_arr = Array.new
    #
    # @in_group.each do |group|
    #   @portfolio = Portfolio.where(group_id: group.id).order(date: :desc)
    #   @portfolio.each do |port|
    #     competition_portfolio = Competition.where(portfolio_id:port.id).first
    #     activity_portfolio = Activity.where(portfolio_id:port.id).first
    #     if !competition_portfolio.nil?
    #       @competition_portfolio_arr.push([port, competition_portfolio])
    #     else
    #       @activity_portfolio_arr.push([port, activity_portfolio])
    #     end
    #   end
    # end
    #
    # #LogBreak
    # @breaking_arr = Array.new
    # @breaking = LogBreak.where(student_id: @student.id)
    # @breaking.each do |_break|
    #   rule = Rule.find_by(id: _break.rule_id)
    #   @breaking_arr.push([_break, rule])
    # end
    #
    # #Curriculum
    # @required_subject = Require.where(curriculum_id: @student.curriculum_id).order(:course_id)
    # @required_subject_arr = Array.new
    # @required_subject.each do |subject|
    #   subject_detail = Course.find_by(id: subject.course_id)
    #   @required_subject_arr.push([subject, subject_detail])
    # end
    #
    # @enrolled_course = Enrollment.joins("INNER JOIN sections ON enrollments.section_id = sections.id").select("sections.course_id, enrollments.grade, enrollments.student_id").order("sections.course_id")


		respond_to do |format|
			format.html { render :show }
			format.json { render json: Oj.dump(@personnel) }
		end
  end

  # GET /personnels/new
  def new
    @personnel = Personnel.new
  end

  # GET /personnels/1/edit
  def edit
  end

  # POST /personnels
  # POST /personnels.json
  def create
    @personnel = Personnel.new(personnel_params)

    respond_to do |format|
      if @personnel.save
        format.html { redirect_to @personnel, notice: 'Personnel was successfully created.' }
        format.json { render :show, status: :created, location: @personnel }
      else
        format.html { render :new }
        format.json { render json: @personnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personnels/1
  # PATCH/PUT /personnels/1.json
  def update
    respond_to do |format|
      if @personnel.update(personnel_params)
        format.html { redirect_to @personnel, notice: 'Personnel was successfully updated.' }
        format.json { render :show, status: :ok, location: @personnel }
      else
        format.html { render :edit }
        format.json { render json: @personnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personnels/1
  # DELETE /personnels/1.json
  def destroy
    @personnel.destroy
    respond_to do |format|
      format.html { redirect_to personnels_url, notice: 'Personnel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personnel
      @personnel = Personnel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personnel_params
      params.fetch(:personnel, {}).permit(:id, :email, :password, :password_confirmation, :role, :first_name, :last_name)
    end


end
