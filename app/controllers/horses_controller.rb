class HorsesController < ApplicationController
  before_action :find_horse, only: [:show, :edit, :update, :destroy]
  before_action :all_horse, only: [:index]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
      if params[:search]
        @horses = Horse.search(search_params)

      else
        @horses = Horse.all
                       .where
                       .not(latitude: nil, longitude: nil)
                       .order("created_at DESC")
      end

    @hash = Gmaps4rails.build_markers(@horses) do |horse, marker|
      marker.lat horse.latitude
      marker.lng horse.longitude
    end
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
      HorseMailer.creation_confirmation(@horse).deliver_now
      redirect_to @horse
      flash[:notice] = "Votre annonce a bien été enrengistrée."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @horse.update(horse_params)
      redirect_to @horse
      flash[:notice] = "Votre annonce a bien été mis à jour."
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

  def horse_params
    params.require(:horse).permit(:name, :description, :title, :birth_date, :address, :sexe, :race, :disciplines, :character, :required_level, :monthly_price, :average_rating, :horse_pic, photos: [])
  end

  def search_params
    params.require(:search).permit(:race, :address, :begin_date, :final_date)
  end
end
