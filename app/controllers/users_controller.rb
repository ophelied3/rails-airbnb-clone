class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @bookings = current_user.bookings
    @horses = current_user.horses
    params[:information]
  end

end
