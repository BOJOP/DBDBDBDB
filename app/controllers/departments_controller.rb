class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_personnel

  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.all

		respond_to do |format|
			format.html { render :index }
			format.json { render json: Oj.dump(@departments) }
		end
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @curriculums = Curriculum.where(department_id: @department.id);
    @numStudentYear = Student.where("enroll_year > ? ", Date.today.year-90).where(curriculum_id: @curriculums.to_a).select("COUNT(*) as num, enroll_year as year").group("enroll_year").order(enroll_year: :asc)

    @numStudentStatus = Student.where(curriculum_id: @curriculums.to_a).select("COUNT(*) as num, status").group("status").order(status: :asc)

    @numStudentCurriculum= Curriculum.where(id: @curriculums.to_a).joins(:students).select("COUNT(*) as num, name").group("id").order(id: :asc)

		respond_to do |format|
			format.html { render :show }
			format.json { render json: Oj.dump(@department) }
		end
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.fetch(:department, {}).permit(:id, :name)
    end
end
