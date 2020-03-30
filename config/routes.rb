Rails.application.routes.draw do
  mount Cinemax::Movie => '/api'
  mount Cinemax::Reservation => '/api'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end