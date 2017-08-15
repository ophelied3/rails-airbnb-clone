class PagesController < ApplicationController
  def home
    @horses = Horse.all.sample(3)
    if user_signed_in?
      redirect_to horses_path
    end
  end
end
