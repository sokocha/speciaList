class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :set_booking, only: [:new, :create, :index]

  respond_to :html

  def index
    @ratings = @booking.ratings
  end

  def show
    respond_with(@rating)
  end

  def new
    @rating = @booking.ratings.new
  end

  def edit
  end

  def create

    @rating = @booking.ratings.new(rating_params)
    @rating.user = current_user

   respond_to do |format|
      if @rating.save
        format.html { redirect_to @booking, notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @booking, notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to @booking, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def set_booking
      @booking = Booking.find(params[:booking_id])
    end

    def rating_params
      params.require(:rating).permit(:professionalism_rating, :quality_rating, :booking_id)
    end
end
