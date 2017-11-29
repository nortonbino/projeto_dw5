class Residents::DashboardController < ApplicationController	 
	before_action :authenticate_resident!
	
  before_action :set_condominium, only: [:show]
	before_action :set_resident
  

  def index
    @condominia = @resident.condominia
  end

  def show
    @condominium

    @my_date = params[:date].nil? ? Date.today : Date.new(params[:date][:year].to_i, params[:date][:month].to_i)
    @my_date = @my_date - @my_date.day + 1  
    @fees = @condominium.fees.where('lastinstallment > ?', @my_date).where('firstinstallment <= ?', @my_date)

    @fees = if params[:term]
      @condominium.fees.where('name LIKE ?', "%#{params[:term]}%")
    else
     @condominium.fees.where('lastinstallment > ?', @my_date).where('firstinstallment <= ?', @my_date) 
    end
  end

def show_fee
    @fee = @condominium.fees.find(params[:fee_id])
end


private

  def set_condominium
    @condominium = Condominium.find(params[:id])
  end

  def set_resident
    @resident = current_resident
  end
end
