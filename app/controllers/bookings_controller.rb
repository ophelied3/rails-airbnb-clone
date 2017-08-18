class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show set_status_pending set_status_accepted set_status_decline set_status_done]
  before_action :booking_update

  def show
    if current_user == @booking.user || current_user == @booking.horse.user
      @horse = @booking.horse
    else
      redirect_to horses_path
    end
  end

  def create
    @horse = Horse.find(params[:horse_id])
    @booking = current_user.bookings.new(booking_params)
    @booking.horse = @horse
    @booking.price = booking_price
    @booking.status = 'En attente'

    if @horse.user == current_user
      flash[:alert] = 'Vous ne pouvez pas réserver votre propre cheval.'
      render 'horses/show'
      return 0
    elsif @booking.save
      respond_to do |format|
        format.html {
          redirect_to @booking
          flash[:notice] = 'La demande de demi-pension a bien été envoyée au propriétaire.'
        }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'horses/show' }
        format.js
      end
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @horse = @booking.horse

    if @booking.update(booking_params)
      redirect_to @booking
      flash[:notice] = 'La mise-à-jour des informations a bien été prise en compte.'
    else
      render :show
    end
  end

  def set_status_accepted
    @booking.mark('Valider')
    redirect_to @booking
  end

  def set_status_decline
    @booking.mark('Refuser')
    redirect_to @booking
  end

  def set_status_done
    @booking.mark('Terminer')
    redirect_to @booking
  end

  def set_status_canceled
    @booking.mark('Annuler')
    redirect_to @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :horse_id, :user_id, :price, :rating, :status)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_update
    Booking.all.each do |booking|
      booking.mark('Terminer') if booking.end_date == Date.today
    end
  end

  def booking_price
    month_num = (@booking.end_date - @booking.start_date) / 30
    @horse.monthly_price * month_num.to_f.round(2)
  end
end
