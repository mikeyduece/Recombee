Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/all_movies',        to: 'movies#index'
      get '/:movie_id/recomms', to: 'recommendations#index'
    end
  end
end
