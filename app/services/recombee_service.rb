class RecombeeService
  include RecombeeApiClient

  def initialize(movie_id)
    @movie_id  = movie_id
    @client = RecombeeClient.new('movielens', ENV['RECOMBEE_API'])
  end

  def self.get_recomms(movie_id)
    new(movie_id).get_recomms
  end

  def get_recomms
    result = client.send(ItemBasedRecommendation.new(movie_id, 5))
  end

  private
    attr_reader :movie_id
end
