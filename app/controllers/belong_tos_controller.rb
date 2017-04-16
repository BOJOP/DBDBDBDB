class BelongTosController < ApplicationController
  before_action :set_belong_to, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_personnel

  # GET /belong_tos
  # GET /belong_tos.json
  def index
    @belong_tos = BelongTo.all
    respond_to do |format|
			format.html { render :index }
			format.json { render json: Oj.dump(@belong_tos) }
		end
  end

  # GET /belong_tos/1
  # GET /belong_tos/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: Oj.dump(@belong_to) }
    end
  end

  # GET /belong_tos/new
  def new
    @belong_to = BelongTo.new
  end

  # GET /belong_tos/1/edit
  def edit
  end

  # POST /belong_tos
  # POST /belong_tos.json
  def create
    @belong_to = BelongTo.new(belong_to_params)

    respond_to do |format|
      if @belong_to.save
        format.html { redirect_to @belong_to, notice: 'Belong to was successfully created.' }
        format.json { render :show, status: :created, location: @belong_to }
      else
        format.html { render :new }
        format.json { render json: @belong_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /belong_tos/1
  # PATCH/PUT /belong_tos/1.json
  def update
    respond_to do |format|
      if @belong_to.update(belong_to_params)
        format.html { redirect_to @belong_to, notice: 'Belong to was successfully updated.' }
        format.json { render :show, status: :ok, location: @belong_to }
      else
        format.html { render :edit }
        format.json { render json: @belong_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /belong_tos/1
  # DELETE /belong_tos/1.json
  def destroy
    @belong_to.destroy
    respond_to do |format|
      format.html { redirect_to belong_tos_url, notice: 'Belong to was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_belong_to
      @belong_to = BelongTo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def belong_to_params
      params.fetch(:belong_to, {})
    end
end
