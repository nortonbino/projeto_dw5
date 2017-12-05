class Residents::DashboardController < ApplicationController	 
	before_action :authenticate_resident!
  
  before_action :set_condominium, only: [:show]
	before_action :set_resident
  

  def index
    @condominia = @resident.condominia
  end

  def show_fee
      @fee = @condominium.fees.find(params[:fee_id])
  end


private

  def set_condominium
    @condominium = Condominium.find(params[:condominium_id])
  end

  def set_resident
    @resident = current_resident
  end
end
