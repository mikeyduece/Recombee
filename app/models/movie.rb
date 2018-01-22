class Movie < ApplicationRecord
  validates :title, uniqueness: true

  def self.get_recs(movie_id)
    recs = RecommendationService.get_recomms(movie_id)
    find(recs)
  end
end
