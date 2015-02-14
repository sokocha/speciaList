class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  

  respond_to :html

  def index
    @listings = Listing.all
    @available_jobs = @listings.where(status: 'uncontracted')
    respond_with(@listings)
  end

  def show
    # @offer = @listing.offers.new
    @offers = @listing.offers
    respond_with(@listing)
  end

  def new
    @listing = Listing.new
    respond_with(@listing)
  end

  def edit

  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save
    respond_with(@listing)
  end

  def update
    @listing.update(listing_params)
    respond_with(@listing)

  end

  def destroy
    @listing.destroy
    respond_with(@listing)
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:title, :budget, :description, :image, :status, :user_id, :category_id, :offers_attributes=>[:id,:hours, :price, :user_id])
    end
end
