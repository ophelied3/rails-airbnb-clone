class HorsesController < ApplicationController

  def index
    @horses = Horse.all
  end

  def show
    @horse = Horse.find(params[:id])
    @booking = Booking.new
  end

  def new
    @horse = Horse.new
    @user = current_user
  end

  def create
    @horse = current_user.horses.new(horse_params)
    if @horse.save!
      redirect_to @horse
    else
      render :new
    end
  end

  def edit
    @horse = Horse.find(params[:id])
  end

  def update
    @horse = Horse.new(horse_params)
    if @horse.update!
      redirect_to @horse
    else
      render :edit
    end
  end

  def destroy
    @horse = Horse.find(params[:id])
    @horse.destroy
    redirect_to horses_path
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :description, :photos, :title, :birth_date, :address, :sexe, :race, :disciplines, :character, :required_level, :monthly_price)
  end

end
