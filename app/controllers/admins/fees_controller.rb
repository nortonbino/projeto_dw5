class Admins::FeesController < ApplicationController
  before_action :authenticate_admin!

  before_action :set_condominium
  before_action :set_fee, only: [:show, :edit, :update, :destroy]

  def index
    @fees = @condominium.fees
  end

  def show
  end

  def new
    @fee = @condominium.fees.build
  end

  # GET /fees/1/edit
  def edit
  end

  def create
    @fee =  @condominium.fees.build(fee_params)
    @fee.lastinstallment = Date.today.end_of_month + @fee.installment.months - 1.month
    @fee.firstinstallment = Date.today.beginning_of_month
    if @fee.save
        flash[:success] = 'Fee was successfully created.'
        redirect_to admins_condominium_path(@condominium)
      else
        render :new
    end
  end

  def update
      if @fee.update(fee_params)
        @fee.lastinstallment = @fee.created_at + @fee.installment.months - 1.month
        @fee.save
        flash[:success] = 'Fee was successfully updated.'
        redirect_to admins_condominium_fee_path
      else
        render :edit
    end
  end

  def destroy
    @fee.destroy
      flash[:success] = 'Fee was successfully destroyed.'
      redirect_to admins_condominium_path(@condominium)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condominium
     @condominium = Condominium.find(params[:condominium_id])
    end
      
    def set_fee
      @fee = @condominium.fees.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_params
      params.require(:fee).permit(:value, :installment, :name, :description)
    end

end