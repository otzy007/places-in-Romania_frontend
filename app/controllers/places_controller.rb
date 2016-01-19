class PlacesController < ApplicationController
  def index
    @random_place = Place.random
  end

  def search
    @places = Place.search(params.require(:q))
  end

  def nearby
    @places = Place.search where: {
      location: {
        near: [params.require(:lat), params.require(:long)],
        within: '50km'
      }
    }

    render :search
  end
end
