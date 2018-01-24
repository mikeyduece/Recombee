class Api::V1::MoviesController < Api::V1::ApplicationController

  def index
    movies = Movie.all
    paginate json: movies, per_page: 50
  end
end
