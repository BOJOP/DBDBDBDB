class RequiresController < ApplicationController
  before_action :set_require, only: [:show, :edit, :update, :destroy]

  # GET /requires
  # GET /requires.json
  def index
    @requires = Require.all
  end

  # GET /requires/1
  # GET /requires/1.json
  def show
  end

  # GET /requires/new
  def new
    @require = Require.new
  end

  # GET /requires/1/edit
  def edit
  end

  # POST /requires
  # POST /requires.json
  def create
    @require = Require.new(require_params)

    respond_to do |format|
      if @require.save
        format.html { redirect_to @require, notice: 'Require was successfully created.' }
        format.json { render :show, status: :created, location: @require }
      else
        format.html { render :new }
        format.json { render json: @require.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requires/1
  # PATCH/PUT /requires/1.json
  def update
    respond_to do |format|
      if @require.update(require_params)
        format.html { redirect_to @require, notice: 'Require was successfully updated.' }
        format.json { render :show, status: :ok, location: @require }
      else
        format.html { render :edit }
        format.json { render json: @require.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requires/1
  # DELETE /requires/1.json
  def destroy
    @require.destroy
    respond_to do |format|
      format.html { redirect_to requires_url, notice: 'Require was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_require
      @require = Require.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def require_params
      params.fetch(:require, {})
    end
end
