class Admins::ResidentsController < ApplicationController  
  before_action :authenticate_admin!

  before_action :set_condominium

  before_action :set_resident, only: [:show, :edit, :update, :destroy]

  def index
  	@residents = @condominium.residents
  end

  def new
    @resident_by_email = search_by_email(params[:resident_mail])

    # Valida se o residente já existe na lista do condominio  
    if @condominium.residents.include?(@resident_by_email)
      flash[:error] = "Resident is already in the condominium"
      render :new 
    else
      # Valida se o residente já existe no banco de dados 
      if @resident_by_email
        @condominium.residents << @resident_by_email
        flash[:success] = "Resident added at the condominium" 
        redirect_to admins_condominium_residents_path(@condominium)
      end
    end
    
    @resident = @condominium.residents.build  
  end

  def create
  	@resident = @condominium.residents.build resident_params
    if @resident.save
      @condominium.residents << @resident
      flash[:success] = "Resident created and added to the condominium"
      redirect_to admins_condominium_residents_path(@condominium)
    else
      flash[:error] = "Make sure all the fields are correct"
      redirect_to new_admins_condominium_resident_path
    end
  end

  def destroy
    # @resident.destroy
    flash[:success] = 'resident was successfully destroyed.'
    redirect_to admins_condominium_residents_path
  end

  def search_by_email(email)
    Resident.find_by_email(email)
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