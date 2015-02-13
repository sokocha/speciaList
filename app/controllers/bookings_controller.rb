class BookingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  


  respond_to :html

  def index
    @bookings = Booking.all
    respond_with(@bookings)
  end

  def show
    @booking = Booking.find(params[:id])
    @comments = @booking.comment_threads.order('created_at desc')
    # @comment = Comment.build_from(@booking, current_user.id, "")
    #@comment = current_user.comments.new

    if current_user
      @comment = Comment.build_from(@booking, current_user.id, "" )
    end

  end


  def new
    @booking = Booking.new
    respond_with(@booking)
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    respond_with(@booking)
  end

  def update
    @booking.update(booking_params)
    respond_with(@booking)
  end

  def destroy
    @booking.destroy
    respond_with(@booking)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:listing_id, :offer_id, :status)
    end
end
