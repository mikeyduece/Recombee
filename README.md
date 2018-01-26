# Recombee Test Task 
#### Rails API

###Dependencies

```ruby
Rails 5
Ruby 2.4.1
```

This Rails api serves up JSON for the React frontend. Available endpoints are as follows:

##### Get

`api/v1/all_movies`

    >Returns paginated list of all Movies provided by Recombee for this test.
    
##### Get

`/api/v1/:movie_id/recomms`

    >Return list of 5 movies recommended for the movie id. The list is provided by Recombee's cloud recommendation service.        The list is populated by Recombee's service which takes into consideration, ratings for each movie.
    
This application uses Redis to cache the recommendations returning for 3 hours to lessen the number of times the Recombee api is hit.
