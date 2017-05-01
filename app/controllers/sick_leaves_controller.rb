class SickLeavesController < ApplicationController
  before_action :set_sick_leave, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_personnel

  # GET /sick_leaves
  # GET /sick_leaves.json
  def index
    @sick_leaves = SickLeave.all
    respond_to do |format|
			format.html { render :index }
			format.json { render json: Oj.dump(@sick_leaves) }
		end
  end

  # GET /sick_leaves/1
  # GET /sick_leaves/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: Oj.dump(@sick_leave) }
    end
  end

  # GET /sick_leaves/new
  def new
    @sick_leave = SickLeave.new
  end

  # GET /sick_leaves/1/edit
  def edit
  end

  # POST /sick_leaves
  # POST /sick_leaves.json
  def create
    @sick_leave = SickLeave.new(sick_leave_params)
    @leave = Leave.new(leave_params)

    respond_to do |format|
      if @sick_leave.save
        format.html { redirect_to @sick_leave, notice: 'Sick leave was successfully created.' }
        format.json { render :show, status: :created, location: @sick_leave }
      else
        format.html { render :new }
        format.json { render json: @sick_leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sick_leaves/1
  # PATCH/PUT /sick_leaves/1.json
  def update
    respond_to do |format|
      if @sick_leave.update(sick_leave_params)
        format.html { redirect_to @sick_leave, notice: 'Sick leave was successfully updated.' }
        format.json { render :show, status: :ok, location: @sick_leave }
      else
        format.html { render :edit }
        format.json { render json: @sick_leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sick_leaves/1
  # DELETE /sick_leaves/1.json
  def destroy
    @sick_leave.destroy
    respond_to do |format|
      format.html { redirect_to sick_leaves_url, notice: 'Sick leave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sick_leave
      @sick_leave = SickLeave.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sick_leave_params
      params.fetch(:sick_leave, {}).permit(:reason)
    end

    def leave_params
      params.fetch(:leave, {}).permit(:start_date,:end_date,:group_id)
    end

end
