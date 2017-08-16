class HorsesController < ApplicationController
  before_action :find_horse, only: [:show, :edit, :update, :destroy]
  before_action :all_horse, only: [:index]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def show
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
  end

  def update
    if @horse.update(horse_params)
      redirect_to @horse
    else
      render :edit
    end
  end

  def destroy
    @horse.destroy
    redirect_to horses_path
  end

  private

  def find_horse
    @horse = Horse.find(params[:id])
  end

  def all_horse
    @horses = Horse.all
  end

  def search(search)
    horse_search = []
    @horses.each do |horse|
      horse_search << horse if horse.address.downcase.include? params[:address].downcase
    end
    return horse_search
  end

  def horse_params
    params.require(:horse).permit(:name, :description, :title, :birth_date, :address, :sexe, :race, :disciplines, :character, :required_level, :monthly_price, :horse_pic, photos: [])
  end

end
