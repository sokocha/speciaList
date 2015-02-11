class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  

  respond_to :html


 def show
  respond_with(@offer)
 end

  def new
    @offer = Offer.new
    respond_with(@offer)
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.save
    @listing = Listing.where(id: @offer.listing_id).map {|listing| listing}
    redirect_to listing_path(@listing)
  end

  def update
    @offer.update(offer_params)
    # respond_with(@offer)
    redirect_to(listing_path(@offer.listing_id))
  end

  def destroy
    @offer.destroy
    respond_with(@offer)
  end

  private
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:price, :status, :listing_id, :user_id)
    end
end
