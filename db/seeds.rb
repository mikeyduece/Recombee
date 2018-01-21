

Movie.delete_all
Rating.delete_all

movie_batch = []

CSV.foreach './db/movie_lens/movies.csv', headers: true, header_converters: :symbol do |row|

  movie_batch << Movie.new(id: row[0], title: row[1], genre: row[2])

end

Movie.import movie_batch

