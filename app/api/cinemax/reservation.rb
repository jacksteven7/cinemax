module Cinemax
  class Reservation < Grape::API
    version 'v1', using: :path
    format :json

    resource :cinemax do
      get "reservations" do
        date_from = Date.parse(params[:date_from])
        date_to = Date.parse(params[:date_to])
        reservations = DB[:reservations].where(rdate: date_from..date_to)
        reservations
      end
    end
  end
end