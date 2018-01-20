class AddRating

  attr_reader :item_id, :user_id, :rating, :timestamp

  def initialize(user_id, item_id, rating, optional)
    @movie_id  = movie_id
    @user_id   = user_id
    @rating    = rating
    @timestamp = optional[timestamp]
  end
end
