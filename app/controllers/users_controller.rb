class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if current_user == @user
      @bookings = current_user.bookings
      @horses = current_user.horses
      params[:information]
    else
      redirect_to horses_path
    end
  end
end
