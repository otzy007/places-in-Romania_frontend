class PlacesController < ApplicationController
  def index
    @random_place = Place.random
  end

  def search
    @places = Place.search(params.require(:q))
  end
end
