require 'rails_helper'

describe 'Recombee API' do
  context 'All Movies' do
    it 'return list of all movies in database' do
      movie = Movie.create(id: 117, title: "Robin Hood: Men in Tights (1993)", genre: "Comedy")
      movie_1  = Movie.create(id: 2997, title: 'Being John Malkovich (1999)', genre: "Comedy")
      movie_2  = Movie.create(id: 2700, title: 'South Park: Bigger, Longer and Uncut (1999)', genre: "Animation|Comedy")
      movie_3  = Movie.create(id: 2291, title: 'Edward Scissorhands (1990)', genre: "Drama|Romance")
      movie_4  = Movie.create(id: 2959, title: 'Fight Club (1999)', genre: "Drama")
      movie_5  = Movie.create(id: 293, title: 'Professional, The (a.k.a Leon: The Professional) (1994)', genre: "Crime|Drama|Romance|Thriller")
      movie_6  = Movie.create(id: 1, title: 'Toy Story (1995)', genre: "Animation|Children's|Comedy")
      movie_7  = Movie.create(id: 3550, title: 'Hunger, The (1983)', genre: 'Horror')
      movie_8  = Movie.create(id: 3114, title: 'Toy Story 2 (1999)', genre: "Animation|Children's|Comedy")
      movie_9  = Movie.create(id: 260, title: 'Star Wars: Episode IV - A New Hope (1997)', genre: "Action|Adventure|Sci-Fi")
      movie_10 = Movie.create(id: 1198, title: 'Raiders of the Lost Ark (1981)', genre: "Action|Adventure")
      movie_11 = Movie.create(id: 1196, title: 'Star Wars: Episode V - The Empire Strikes Back (1980)', genre: "Action|Adventure|Drama|Sci-Fi|War")

      get '/api/v1/all_movies'

      expect(response).to be_success
      recs = JSON.parse(response.body)

      expect(recs.count).to eq(12)
      expect(recs[0]['title']).to eq("Robin Hood: Men in Tights (1993)")
    end
  end

  context 'Item Based Recommendations' do
    it 'returns list of recommended movies' do
      movie = Movie.create(id: 117, title: "Robin Hood: Men in Tights (1993)", genre: "Comedy")
      movie_1  = Movie.create(id: 2997, title: 'Being John Malkovich (1999)', genre: "Comedy")
      movie_2  = Movie.create(id: 2700, title: 'South Park: Bigger, Longer and Uncut (1999)', genre: "Animation|Comedy")
      movie_3  = Movie.create(id: 2291, title: 'Edward Scissorhands (1990)', genre: "Drama|Romance")
      movie_4  = Movie.create(id: 2959, title: 'Fight Club (1999)', genre: "Drama")
      movie_5  = Movie.create(id: 293, title: 'Professional, The (a.k.a Leon: The Professional) (1994)', genre: "Crime|Drama|Romance|Thriller")
      movie_6  = Movie.create(id: 1, title: 'Toy Story (1995)', genre: "Animation|Children's|Comedy")
      movie_7  = Movie.create(id: 3550, title: 'Hunger, The (1983)', genre: 'Horror')
      movie_8  = Movie.create(id: 3114, title: 'Toy Story 2 (1999)', genre: "Animation|Children's|Comedy")
      movie_9  = Movie.create(id: 260, title: 'Star Wars: Episode IV - A New Hope (1997)', genre: "Action|Adventure|Sci-Fi")
      movie_10 = Movie.create(id: 1198, title: 'Raiders of the Lost Ark (1981)', genre: "Action|Adventure")
      movie_11 = Movie.create(id: 1196, title: 'Star Wars: Episode V - The Empire Strikes Back (1980)', genre: "Action|Adventure|Drama|Sci-Fi|War")

      get "/api/v1/#{movie.id}/recomms"

      expect(response).to be_success
      recs = JSON.parse(response.body)

      expect(recs.count).to eq(5)

      expect(recs.any? {|rec| rec['id'] == 2997}).to be true
      expect(recs.any? {|rec| rec['id'] == 1196}).to_not be true
    end
  end
end
