class RecommendationService

  def initialize(attrs)

  end

  def self.get_recomms(movie_id)
    recomms = RecombeeService.get_recomms(movie_id)
  end
end
