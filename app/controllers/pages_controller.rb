class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @horses = Horse.all.sample(3)
  end
end
