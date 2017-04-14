class PersonalLeavesController < ApplicationController
  before_action :set_personal_leafe, only: [:show, :edit, :update, :destroy]

  # GET /personal_leaves
  # GET /personal_leaves.json
  def index
    @personal_leaves = PersonalLeave.all
  end

  # GET /personal_leaves/1
  # GET /personal_leaves/1.json
  def show
  end

  # GET /personal_leaves/new
  def new
    @personal_leafe = PersonalLeave.new
  end

  # GET /personal_leaves/1/edit
  def edit
  end

  # POST /personal_leaves
  # POST /personal_leaves.json
  def create
    @personal_leafe = PersonalLeave.new(personal_leafe_params)

    respond_to do |format|
      if @personal_leafe.save
        format.html { redirect_to @personal_leafe, notice: 'Personal leave was successfully created.' }
        format.json { render :show, status: :created, location: @personal_leafe }
      else
        format.html { render :new }
        format.json { render json: @personal_leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_leaves/1
  # PATCH/PUT /personal_leaves/1.json
  def update
    respond_to do |format|
      if @personal_leafe.update(personal_leafe_params)
        format.html { redirect_to @personal_leafe, notice: 'Personal leave was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_leafe }
      else
        format.html { render :edit }
        format.json { render json: @personal_leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_leaves/1
  # DELETE /personal_leaves/1.json
  def destroy
    @personal_leafe.destroy
    respond_to do |format|
      format.html { redirect_to personal_leaves_url, notice: 'Personal leave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_leafe
      @personal_leafe = PersonalLeave.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_leafe_params
      params.fetch(:personal_leafe, {})
    end
end
