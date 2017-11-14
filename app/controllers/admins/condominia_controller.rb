class Admins::CondominiaController < ApplicationController
  before_action :authenticate_admin!

  before_action :set_condominium, only: [:show, :edit, :update, :destroy]

  def index
    @condominia = Condominium.all
  end

  def show
    @my_date = params[:date].nil? ? Date.today : Date.new(params[:date][:year].to_i, params[:date][:month].to_i)
    @my_date = @my_date - @my_date.day + 1  
    @fees = @condominium.fees.where('lastinstallment > ?', @my_date).where('firstinstallment <= ?', @my_date)

    @fees = if params[:term]
      @condominium.fees.where('name LIKE ?', "%#{params[:term]}%")
    else
     @condominium.fees.where('lastinstallment > ?', @my_date).where('firstinstallment <= ?', @my_date) 
    end

    @residents = @condominium.residents
  end

  def new
    @condominium = current_admin.condominia.build
  end

  def edit
  end

  def create
    @condominium = current_admin.condominia.build(condominium_params)
    if @condominium.save
        flash[:success] = 'Condominium was successfully created.'
        redirect_to admins_condominium_path(@condominium)
    else
        render :new 
    end
  end

  def update
      if @condominium.update(condominium_params)
        flash[:success] =  'Condominium was successfully updated.' 
        redirect_to admins_condominium_path(@condominium)
      else
        flash[:error] =  'Condominium was not updated.' 
        render :edit

    end
  end

  def destroy
    @condominium.destroy
    flash[:success] = 'Condominium was successfully destroyed.'
    redirect_to admins_condominia_url
  end

  def find_fees
        @fees = @condominium.fees.where("name = ?", "teste")
  end

  def send_email
    @condominium = Condominium.find(params[:condominium_id])

    @condominium.residents.each do |resident| 
       CondominiumMailer.send_fees_email(resident).deliver_later
    end
    
    
    flash[:success] = 'Email enviado com sucesso'
    redirect_back(fallback_location: root_path)
  end

  def residents
    @residents = @condominium.residents
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
