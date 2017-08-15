class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @bookings = current_user.bookings
  end

end
