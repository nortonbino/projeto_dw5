class Admins::ResidentsController < ApplicationController  
  before_action :authenticate_admin!

  before_action :set_condominium

  before_action :set_resident, only: [:show, :edit, :update, :destroy]

  def index
  	@residents = @condominium.residents
  end

  def new
  	@resident = @condominium.residents.build
  end

  def create
  	@resident = @condominium.residents.build resident_params

  	if @resident.save
  		flash[:success] = "Resident created"
  		redirect_to admins_condominium_path(@condominium)
  	else
  		flash.now[:error] = "Something went wrong"
  		render :new
  	end
  end

  private

    def set_condominium
     @condominium = Condominium.find(params[:condominium_id])
    end

    def set_resident
      @resident = @condominium.residents.find(params[:id])
    end

   def resident_params
   		params.require(:resident).permit(:email, :password, :password_confirmation)
   end

end