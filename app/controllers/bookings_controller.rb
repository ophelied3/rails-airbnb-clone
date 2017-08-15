class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @horse = Horse.find(params[:horse_id])
  end

  def create
    @horse = Horse.find(params[:horse_id])
    @booking = current_user.bookings.new(booking_params)
    @booking.horse = @horse
    @booking.price = @horse.monthly_price

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :horse_id, :user_id, :price, :rating)
  end
end
