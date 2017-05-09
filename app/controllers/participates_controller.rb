class ParticipatesController < ApplicationController
  before_action :set_participate, only: [:show, :edit, :update, :destroy]

  # GET /participates
  # GET /participates.json
  def index
    @participates = Participate.all
    respond_to do |format|
			format.html { render :index }
			format.json { render json: Oj.dump(@participates) }
		end

  end

  # GET /participates/1
  # GET /participates/1.json
  def show
		respond_to do |format|
      format.html { render :show }
      format.json { render json: Oj.dump(@participate) }
    end

  end

  # GET /participates/new
  def new
    @participate = Participate.new
  end

  # GET /participates/1/edit
  def edit
  end

  # POST /participates
  # POST /participates.json
  def create
    @participate = Participate.new(participate_params)

    respond_to do |format|
      if @participate.save
        format.html { redirect_to :back, notice: 'Participate was successfully created.' }
        format.json { render :show, status: :created, location: @participate }
      else
        format.html { redirect_to :back, notice: @participate.errors }
        format.json { render json: @participate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participates/1
  # PATCH/PUT /participates/1.json
  def update
    respond_to do |format|
      if @participate.update(participate_params)
        format.html { redirect_to @participate, notice: 'Participate was successfully updated.' }
        format.json { render :show, status: :ok, location: @participate }
      else
        format.html { render :edit }
        format.json { render json: @participate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participates/1
  # DELETE /participates/1.json
  def destroy
    @participate.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Participate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participate
      @participate = Participate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participate_params
      params.fetch(:participate, {}).permit(:event_id,:group_id,:position,:duration)
    end
end
