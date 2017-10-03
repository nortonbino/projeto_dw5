class CondominiaController < ApplicationController
  before_action :authenticate_user!

  before_action :set_condominium, only: [:show, :edit, :update, :destroy]

  # GET /condominia
  # GET /condominia.json
  def index
    @condominia = Condominium.all
  end

  # GET /condominia/1
  # GET /condominia/1.json
  def show
        @fees = Fee.all
  end

  # GET /condominia/new
  def new
    @condominium = current_user.condominium.build
  end

  # GET /condominia/1/edit
  def edit
  end

  # POST /condominia
  # POST /condominia.json
  def create
    @condominium = current_user.condominium.build(condominium_params)

    respond_to do |format|
      if @condominium.save
        format.html { redirect_to @condominium, notice: 'Condominium was successfully created.' }
        format.json { render :show, status: :created, location: @condominium }
      else
        format.html { render :new }
        format.json { render json: @condominium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /condominia/1
  # PATCH/PUT /condominia/1.json
  def update
    respond_to do |format|
      if @condominium.update(condominium_params)
        format.html { redirect_to @condominium, notice: 'Condominium was successfully updated.' }
        format.json { render :show, status: :ok, location: @condominium }
      else
        format.html { render :edit }
        format.json { render json: @condominium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condominia/1
  # DELETE /condominia/1.json
  def destroy
    @condominium.destroy
    respond_to do |format|
      format.html { redirect_to condominia_url, notice: 'Condominium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condominium
      @condominium = Condominium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condominium_params
      params.require(:condominium).permit(:name, :number_proprieties, :address)
    end
end
