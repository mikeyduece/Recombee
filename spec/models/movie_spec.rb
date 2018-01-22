require 'rails_helper'

RSpec.describe Movie, type: :model do
  it {should validate_uniqueness_of :title}

  context 'Class Methods' do
    it '.get_recomms' do
      movie   = Movie.create(id: 1, title: 'Toy Story (1995)', genre: "Animation|Children's|Comedy")
      movie_1 = Movie.create(id: 3550, title: 'Hunger, The (1983)', genre: 'Horror')
      movie_2 = Movie.create(id: 3114, title: 'Toy Story 2 (1999)', genre: "Animation|Children's|Comedy")
      movie_3 = Movie.create(id: 260, title: 'Star Wars: Episode IV - A New Hope (1997)', genre: "Action|Adventure|Sci-Fi")
      movie_4 = Movie.create(id: 1198, title: 'Raiders of the Lost Ark (1981)', genre: "Action|Adventure")
      movie_5 = Movie.create(id: 1196, title: 'Star Wars: Episode V - The Empire Strikes Back (1980)', genre: "Action|Adventure|Drama|Sci-Fi|War")

      movie_recs = Movie.get_recs(movie.id)

      expect(movie_recs.count).to eq(5)
      expect(movie_recs[0]).to be_a(Movie)
      expect(movie_recs[0].title).to eq('Hunger, The (1983)')
    end

    it 'gets different recommendations for different id' do
      movie = Movie.create(id: 117, title: "Robin Hood: Men in Tights (1993)", genre: "Comedy")
      movie_1 = Movie.create(id: 2997, title: 'Being John Malkovich (1999)', genre: "Comedy")
      movie_2 = Movie.create(id: 2700, title: 'South Park: Bigger, Longer and Uncut (1999)', genre: "Animation|Comedy")
      movie_3 = Movie.create(id: 2291, title: 'Edward Scissorhands (1990)', genre: "Drama|Romance")
      movie_4 = Movie.create(id: 2959, title: 'Fight Club (1999)', genre: "Drama")
      movie_5 = Movie.create(id: 293, title: 'Professional, The (a.k.a Leon: The Professional) (1994)', genre: "Crime|Drama|Romance|Thriller")

      movie_recs = Movie.get_recs(movie.id)

      expect(movie_recs.count).to eq(5)
      expect(movie_recs[3]).to be_a(Movie)
      expect(movie_recs[3].title).to eq('Fight Club (1999)')
    end
  end
end
