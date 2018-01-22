class Movie < ApplicationRecord
  validates :title, uniqueness: true

  def self.get_recs(movie_id)
    recs = RecommendationService.get_recomms(movie_id)
    require 'pry'; binding.pry
    find(recs)
  end
end
