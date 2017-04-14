class LogBreaksController < ApplicationController
  before_action :set_log_break, only: [:show, :edit, :update, :destroy]

  # GET /log_breaks
  # GET /log_breaks.json
  def index
    @log_breaks = LogBreak.all
  end

  # GET /log_breaks/1
  # GET /log_breaks/1.json
  def show
  end

  # GET /log_breaks/new
  def new
    @log_break = LogBreak.new
  end

  # GET /log_breaks/1/edit
  def edit
  end

  # POST /log_breaks
  # POST /log_breaks.json
  def create
    @log_break = LogBreak.new(log_break_params)

    respond_to do |format|
      if @log_break.save
        format.html { redirect_to @log_break, notice: 'Log break was successfully created.' }
        format.json { render :show, status: :created, location: @log_break }
      else
        format.html { render :new }
        format.json { render json: @log_break.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /log_breaks/1
  # PATCH/PUT /log_breaks/1.json
  def update
    respond_to do |format|
      if @log_break.update(log_break_params)
        format.html { redirect_to @log_break, notice: 'Log break was successfully updated.' }
        format.json { render :show, status: :ok, location: @log_break }
      else
        format.html { render :edit }
        format.json { render json: @log_break.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /log_breaks/1
  # DELETE /log_breaks/1.json
  def destroy
    @log_break.destroy
    respond_to do |format|
      format.html { redirect_to log_breaks_url, notice: 'Log break was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_break
      @log_break = LogBreak.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_break_params
      params.fetch(:log_break, {})
    end
end
