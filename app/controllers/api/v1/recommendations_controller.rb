class Api::V1::RecommendationsController < Api::V1::ApplicationController

  def index
    recommendations = Movie.get_recs(params[:movie_id])
    render json: recommendations
  end
end
