class CondominiaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_condominium, only: [:show, :edit, :update, :destroy]

  def index
    @condominia = Condominium.all
  end

  def show
    @fees = @condominium.fees 
  end

  def month_fee(date)
    if date.strftime("%m%Y") == Date.today.strftime("%m%Y")
      
    end
  end


  def new
    @condominium = current_user.condominia.build
  end

  def edit
  end


  def create
    @condominium = current_user.condominia.build(condominium_params)

    if @condominium.save
        flash[:success] = 'Condominium was successfully created.'
        redirect_to @condominium
    else
        flash[:error] = 'Condominium was successfully created.'
        render :new 
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
