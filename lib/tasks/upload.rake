require 'recombee_api_client'
include RecombeeApiClient

desc "Upload data from dat file"
task :upload => [:environment] do

  client = RecombeeClient.new('movielens', ENV['RECOMBEE_API'])

  movies = File.read('./db/movie_lens/movies.dat')

  movies.encode!("Windows-1252", invalid: :replace, undef: :replace)

  split_movies = movies.split("\n").map! do |movie|
    movie.split('::')
  end

  rec_movies = []

  split_movies.each do |movie|
    id    = movie[0]
    r = AddItem.new(id)
    rec_movies.push(r)
  end

  begin
    client.send(Batch.new(rec_movies))
    puts 'Movie batch sent.'
  rescue APIError => e
    puts e
  end

  ratings = File.read('./db/movie_lens/ratings.dat')

  ratings.encode!("Windows-1252", invalid: :replace, undef: :replace)

  split_ratings = ratings.split("\n").map! do |rating|
    rating.split('::')
  end.uniq

  recoms = []

  split_ratings.each do |rating|
    user_id  = rating[0]
    item_id  = rating[1]
    rate     = ((rating[2].to_i - 3) / 2)

    r = AddRating.new(user_id, item_id, rate, 'cascadeCreate' => true)
    recoms.push(r)
  end

  begin
    client.send(Batch.new(recoms))
    puts 'Ratings batch sent.'
  rescue APIError => e
    puts e
  end

  # users = File.read('./db/movie_lens/users.dat')
  #
  # users.encode!("Windows-1252", invalid: :replace, undef: :replace)
  #
  # split_users = users.split("\n").map! do |user|
  #   user.split('::')
  # end
  #
  # rec_users = []
  #
  # split_users.each do |user|
  #   id  = user[0]
  #   sex = user[1]
  #        = user[2]
  #   r = AddUser.new(id, user_id, rate, 'cascadeCreate' => true)
  #   recoms.push(r)
  # end
  #
  # br_3 = Batch.new(rec_users)
  # client.send(br_3)
  # puts 'Users batch sent.'
end
