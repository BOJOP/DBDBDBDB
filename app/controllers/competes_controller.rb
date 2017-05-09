class CompetesController < ApplicationController
  before_action :set_compete, only: [:show, :edit, :update, :destroy]

  # GET /competes
  # GET /competes.json
  def index
    @competes = Compete.all
    respond_to do |format|
			format.html { render :index }
			format.json { render json: Oj.dump(@competes) }
		end

  end

  # GET /competes/1
  # GET /competes/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: Oj.dump(@compete) }
    end

  end

  # GET /competes/new
  def new
    @compete = Compete.new
  end

  # GET /competes/1/edit
  def edit
  end

  # POST /competes
  # POST /competes.json
  def create
    @compete = Compete.new(compete_params)

    respond_to do |format|
      if @compete.save
        format.html { redirect_to :back, notice: 'Compete was successfully created.' }
        format.json { render :show, status: :created, location: @compete }
      else
        format.html { redirect_to :back, notice: @compete.errors }
        format.json { render json: @compete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competes/1
  # PATCH/PUT /competes/1.json
  def update
    respond_to do |format|
      if @compete.update(compete_params)
        format.html { redirect_to @compete, notice: 'Compete was successfully updated.' }
        format.json { render :show, status: :ok, location: @compete }
      else
        format.html { render :edit }
        format.json { render json: @compete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competes/1
  # DELETE /competes/1.json
  def destroy
    @compete.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Compete was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compete
      @compete = Compete.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compete_params
      params.fetch(:compete, {}).permit(:event_id,:group_id,:award)

    end
end
