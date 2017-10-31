class CondominiaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_condominium, only: [:show, :edit, :update, :destroy]

  def index
    @condominia = Condominium.all
  end

  def show
    @my_date = params[:date].nil? ? Date.today : DateTime.new(params[:date][:year].to_i, params[:date][:month].to_i)
    @fees = if params[:term]
      @condominium.fees.where('name LIKE ?', "%#{params[:term]}%")
    else
     @condominium.fees
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
        render :new 
    end
  end

  def update
      if @condominium.update(condominium_params)
        flash[:success] =  'Condominium was successfully updated.' 
        redirect_to @condominium
      else
        render :edit 
    end
  end

  def destroy
    @condominium.destroy
    flash[:success] = 'Condominium was successfully destroyed.'
    redirect_to condominia_url
  end

  def find_fees
        @fees = @condominium.fees.where("name = ?", "teste")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condominium
      @condominium = Condominium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condominium_params
      params.require(:condominium).permit(:name, :number_proprieties, :address, :avatar)
    end

end
