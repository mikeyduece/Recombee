class Api::V1::MoviesController < Api::V1::ApplicationController

  def index
    movies = Movie.all
    render json: movies
  end
end
