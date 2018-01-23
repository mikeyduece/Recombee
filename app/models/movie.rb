class Movie < ApplicationRecord
  validates :title, uniqueness: true

  def self.get_recs(movie_id)
    recs = $REDIS.get("recs#{movie_id}")
    if recs.nil?
      recs = RecommendationService.get_recomms(movie_id)
      $REDIS.set("recs#{movie_id}", recs)
      $REDIS.expire("recs#{movie_id}", 3.hour.to_i)
    end
    find(JSON.parse(recs.to_s))
  end

end
