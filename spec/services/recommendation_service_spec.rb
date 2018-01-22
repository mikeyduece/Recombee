require 'rails_helper'

describe 'Recommendation Servie' do
  context 'Class Methods' do
    context '.get_recomms' do
      it 'returns recommendations based on movie id' do
        movie   = Movie.create(id: 1, title: 'Toy Story (1995)', genre: "Animation|Children's|Comedy")
        recomms = RecommendationService.get_recomms(movie.id)

        expect(recomms.count).to eq(5)
      end

      it 'returns different recommendations for different movie id' do
        movie_1   = Movie.create(id: 1, title: 'Toy Story (1995)', genre: "Animation|Children's|Comedy")
        recomms_1 = RecommendationService.get_recomms(movie_1.id)
        movie_2   = Movie.create(id: 2959, title: 'Fight Club (1999)', genre: "Drama")
        recomms_2 = RecommendationService.get_recomms(movie_2.id)

        expect(recomms_1).to_not eq(recomms_2)
      end
    end
  end
end
