class FeesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_fee, only: [:show, :edit, :update, :destroy]
  before_action :set_condominium

  # GET /fees
  # GET /fees.json
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

    if @fee.save
        flash[:success] = 'Fee was successfully created.'
        redirect_to @condominium
      else
        render :new
    end
  end

  def update
      if @fee.update(fee_params)
        flash[:success] = 'Fee was successfully updated.'
        redirect_to @fee
      else
        render :edit
    end
  end

  # DELETE /fees/1
  # DELETE /fees/1.json
  def destroy
    @fee.destroy
      flash[:success] = 'Fee was successfully destroyed.'
      redirect_to fees_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee
      @fee = @condominium.fees.find(params[:id])
    end

    def set_condominium
      @condominium = Condominium.find(params[:condominium_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_params
      params.require(:fee).permit(:value, :installment, :name, :description)
    end

    def current_date
      
    end
end
