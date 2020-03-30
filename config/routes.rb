Rails.application.routes.draw do
  mount Cinemax::Movie => '/api'
  mount Cinemax::Reservation => '/api'
end