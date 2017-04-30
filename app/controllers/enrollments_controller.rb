class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_personnel

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
    respond_to do |format|
			format.html { render :index }
			format.json { render json: Oj.dump(@enrollments) }
		end
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: Oj.dump(@enrollment) }
    end
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)
		
		
		if(!@enrollment.grade)
			@enrollment.grade = nil
		#else 
		#	@grade = 0
		#	if (@enrollment.grade.length==2)
		#		@grade = 0.5;
		#	end
		#	
		#	if (@enrollment.grade != "F")
		#		@enrollment.grade = @enrollment.grade[0].ord - "D".ord
		#	end
		#	@enrollment.grade += @grade;
		end

		respond_to do |format|
      if @enrollment.save
        format.html { redirect_to :back, notice: 'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.fetch(:enrollment, {}).permit(:student_id, :grade, :section_id)
    end
end
