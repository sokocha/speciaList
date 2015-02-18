class ContractorsController < ApplicationController
  before_action :set_contractor, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  

  respond_to :html

  def index
    if params[:tag]
      @contractors = Contractor.tagged_with(params[:tag])
    else
      @contractors = Contractor.all
    end

    @q = @contractors.search(params[:q])
    @contractors = @q.result(distinct: true)
    # respond_with(@contractors)
  end

  def show
    respond_with(@contractor)
  end

  def new
    @contractor = Contractor.new
    @user = current_user
    respond_with(@contractor)
  end

  def edit
  end

  def create
    @contractor = Contractor.new(contractor_params)
    @contractor.save
    redirect_to(user_path(@contractor.user))
  end

  def update
    @contractor.update(contractor_params)
    redirect_to(user_path(@contractor.user))
    
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
      params.require(:contractor).permit(:wage, :certified, :user_id, :category_id, :verified, :status,:tag_list)
    end
end
