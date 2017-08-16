class HorsesController < ApplicationController
  before_action :find_horse, only: [:show, :edit, :update, :destroy]
  before_action :all_horse, only: [:index]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @horses = Horse.where.not(latitude: nil, longitude: nil)
    data = {location: "", start_date: "", end_date: ""}
    unless params["/horses"].nil?
      data = params["/horses"]
    end
    unless data[:location].empty? || data[:start_date].empty? || data[:end_date].empty?
      search_data = {location: data[:location], rayon: data[:rayon], start_date: data[:start_date], end_date: data[:end_date]}
      @horse_search = search(search_data)
    else
      @horse_search = Horse.all.order('created_at DESC')
    end

    @hash = Gmaps4rails.build_markers(@horse_search) do |horse, marker|
      marker.lat horse.latitude
      marker.lng horse.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
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

  def search(data)
    return horse_search = Horse.near(data[:location], data[:rayon]) if data[:start_date].empty? && data[:end_date].empty?
    horses = Horse.near(data[:location], data[:rayon])
    horses = Horse.all.order('created_at DESC') if data[:location].empty?
    horse_search = []
    horses.each do |horse|
      if horse.bookings.first == nil
        horse_search << horse
      else
        horse.bookings.each do |booking|
          start_date = data[:start_date].to_date.between?(booking.start_date, booking.end_date) unless data[:start_date].empty?
          end_date = data[:end_date].to_date.between?(booking.start_date, booking.end_date) unless data[:end_date].empty?
          unless start_date || end_date
            horse_search << horse
          end
        end
      end
    end
    return horse_search
  end

  def horse_params
    params.require(:horse).permit(:name, :description, :title, :birth_date, :address, :sexe, :race, :disciplines, :character, :required_level, :monthly_price, :horse_pic, photos: [])
  end

end
