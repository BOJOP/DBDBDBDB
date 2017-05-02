class PersonalLeavesController < ApplicationController
  before_action :set_personal_leave, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_personnel

  # GET /personal_leaves
  # GET /personal_leaves.json
  def index
    @personal_leaves = PersonalLeave.all
    respond_to do |format|
			format.html { render :index }
			format.json { render json: Oj.dump(@personal_leaves) }
		end
  end

  # GET /personal_leaves/1
  # GET /personal_leaves/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: Oj.dump(@personal_leave) }
    end
  end

  # GET /personal_leaves/new
  def new
    @personal_leave = PersonalLeave.new
  end

  # GET /personal_leaves/1/edit
  def edit
  end

  # POST /personal_leaves
  # POST /personal_leaves.json
  def create
    @leave = Leave.new(leave_params)

    @date = params[:date_start_personal].split('-')
    @leave.start_date = Date.new(@date[0].to_i,@date[1].to_i,@date[2].to_i)
    @date = params[:date_end_personal].split('-')
    @leave.end_date = Date.new(@date[0].to_i,@date[1].to_i,@date[2].to_i)

    @leave.save

    @personal_leave = PersonalLeave.new(personal_leave_params)
    @personal_leave.leave_id = @leave.id

    respond_to do |format|
      if @personal_leave.save
        format.html { redirect_to @personal_leave, notice: 'Personal leave was successfully created.' }
        format.json { render :show, status: :created, location: @personal_leave }
      else
        format.html { render :new }
        format.json { render json: @personal_leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_leaves/1
  # PATCH/PUT /personal_leaves/1.json
  def update
    respond_to do |format|
      if @personal_leave.update(personal_leave_params)
        format.html { redirect_to @personal_leave, notice: 'Personal leave was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_leave }
      else
        format.html { render :edit }
        format.json { render json: @personal_leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_leaves/1
  # DELETE /personal_leaves/1.json
  def destroy
    @personal_leave.destroy
    respond_to do |format|
      format.html { redirect_to personal_leaves_url, notice: 'Personal leave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_leave
      @personal_leaves = PersonalLeave.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_leave_params
      params.fetch(:personal_leave, {}).permit(:project_name)
    end

    def leave_params
      params.fetch(:leave, {}).permit(:start_date,:end_date,:group_id)
    end

end
