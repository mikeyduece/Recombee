class AddRating

  attr_reader :item_id, :user_id, :rating

  def initialize(user_id, item_id, rating)
    @item_id  = item_id
    @user_id   = user_id
    @rating    = rating
  end
end
