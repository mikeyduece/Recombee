require 'rails_helper'

describe 'Ratings Servie' do
  it 'returns recommendations based on item id' do
    movie   = Movie.create(id: 1, title: 'Toy Story (1995)', genre: "Animation|Children's|Comedy")
    recomms = RecommendationService.get_recomms(movie.id)

    expect(recomms.count).to eq(5)
  end
end
