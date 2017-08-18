class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if current_user == @user
      @bookings = current_user.bookings
      @horses = current_user.horses
      @horses_booked = booked_horse
      params[:information]
    else
      redirect_to horses_path
    end
  end
end

private

def booked_horse
  horses_booked = []
  @horses.each do |horse|
    horse.bookings.each do |booking|
      horses_booked << booking
    end
  end
  horses_booked
end
