class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home team]

  def home
    @horses = Horse.all.sample(6)
  end

  def team; end
end
