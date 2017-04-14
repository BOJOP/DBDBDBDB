class SickLeavesController < ApplicationController
  before_action :set_sick_leafe, only: [:show, :edit, :update, :destroy]

  # GET /sick_leaves
  # GET /sick_leaves.json
  def index
    @sick_leaves = SickLeave.all
  end

  # GET /sick_leaves/1
  # GET /sick_leaves/1.json
  def show
  end

  # GET /sick_leaves/new
  def new
    @sick_leafe = SickLeave.new
  end

  # GET /sick_leaves/1/edit
  def edit
  end

  # POST /sick_leaves
  # POST /sick_leaves.json
  def create
    @sick_leafe = SickLeave.new(sick_leafe_params)

    respond_to do |format|
      if @sick_leafe.save
        format.html { redirect_to @sick_leafe, notice: 'Sick leave was successfully created.' }
        format.json { render :show, status: :created, location: @sick_leafe }
      else
        format.html { render :new }
        format.json { render json: @sick_leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sick_leaves/1
  # PATCH/PUT /sick_leaves/1.json
  def update
    respond_to do |format|
      if @sick_leafe.update(sick_leafe_params)
        format.html { redirect_to @sick_leafe, notice: 'Sick leave was successfully updated.' }
        format.json { render :show, status: :ok, location: @sick_leafe }
      else
        format.html { render :edit }
        format.json { render json: @sick_leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sick_leaves/1
  # DELETE /sick_leaves/1.json
  def destroy
    @sick_leafe.destroy
    respond_to do |format|
      format.html { redirect_to sick_leaves_url, notice: 'Sick leave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sick_leafe
      @sick_leafe = SickLeave.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sick_leafe_params
      params.fetch(:sick_leafe, {})
    end
end
