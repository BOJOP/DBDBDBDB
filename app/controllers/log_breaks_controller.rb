class LogBreaksController < ApplicationController
  before_action :set_log_break, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_personnel

  # GET /log_breaks
  # GET /log_breaks.json
  def index
    @log_breaks = LogBreak.all
    respond_to do |format|
			format.html { render :index }
			format.json { render json: Oj.dump(@log_breaks) }
		end
  end

  # GET /log_breaks/1
  # GET /log_breaks/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: Oj.dump(@log_break) }
    end
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

    @date = params[:date].split('-')
    @time = params[:time].split(':')

    @log_break.when = DateTime.new(@date[0].to_i,@date[1].to_i,@date[2].to_i,@time[0].to_i,@time[1].to_i,0);

    respond_to do |format|
      if @log_break.save
        format.html { redirect_to :back, notice: 'Log break was successfully created.' }
        format.json { render :show, status: :created, location: @log_break }
      else
        format.html { redirect_to :back, notice: @log_break.errors }
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
      format.html { redirect_to :back, notice: 'Log break was successfully destroyed.' }
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
      params.fetch(:log_break, {}).permit(:student_id, :remark, :rule_id)
    end
end
