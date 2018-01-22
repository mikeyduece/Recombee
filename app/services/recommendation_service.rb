class RecommendationService

  def self.get_recomms(movie_id)
    RecombeeService.get_recomms(movie_id)
  end
end
