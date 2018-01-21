require 'rails_helper'

describe 'Recombee API' do
  context 'Item Based Recommendations' do
    it 'return recommendations for item id' do
      movie = Movie.create(id: 1, title: 'Toy Story (1995)', genre: "Animation|Children's|Comedy")
      service = RecombeeService.new(movie.id)

      expect(service).to be_a(RecombeeService)

    end
  end
end
