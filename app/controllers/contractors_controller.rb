class ContractorsController < ApplicationController
  before_action :set_contractor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @contractors = Contractor.all
    respond_with(@contractors)
  end

  def show
    respond_with(@contractor)
  end

  def new
    @contractor = Contractor.new
    respond_with(@contractor)
  end

  def edit
  end

  def create
    @contractor = Contractor.new(contractor_params)
    @contractor.save
    respond_with(@contractor)
  end

  def update
    @contractor.update(contractor_params)
    respond_with(@contractor)
  end

  def destroy
    @contractor.destroy
    respond_with(@contractor)
  end

  private
    def set_contractor
      @contractor = Contractor.find(params[:id])
    end

    def contractor_params
      params.require(:contractor).permit(:wage, :certified, :user_id, :category_id, :verified)
    end
end
