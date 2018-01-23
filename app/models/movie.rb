class Movie < ApplicationRecord
  validates :title, uniqueness: true

  def self.get_recs(movie_id)
    recs = $REDIS.get('recs')
    if recs.nil?
      recs = RecommendationService.get_recomms(movie_id)
      $REDIS.set('recs', recs)
      $REDIS.expire('recs', 3.hour.to_i)
    end
    find(JSON.parse(recs.to_s))
  end

end
