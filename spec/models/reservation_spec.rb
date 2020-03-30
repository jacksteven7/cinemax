require 'rails_helper'

describe 'Cinemax tests', type: :request do
  context 'Reservation validation test' do
    before(:all) do
      #Create this movie to test the reservation funtinality
      params = {
        title: "Sherlock1",
        description: "Adventure",
        url: 'shorturl.at/deyF8',
        days: ["Friday","Saturday","Sunday"]
      }
      post "/api/v1/cinemax/movie", params: params

      @movie = DB[:movies].order(:movie_id).last
    end

    it "Create reservation successfully" do
      params = {
        rdate: "21-12-2030",
        persons: 6
      }
      post "/api/v1/cinemax/movie/#{@movie[:movie_id]}/reservation", params: params
      
      expect(response.status).to eq 201
      expect(response.body).to include "Reservation created successfully"
    end

    it "Cant create reservation because exceeds the limit of the cinema" do
      params = {
        rdate: "21-12-2030",
        persons: 6
      }
      post "/api/v1/cinemax/movie/#{@movie[:movie_id]}/reservation", params: params
      
      expect(response.status).to eq 201
      expect(response.body).to include "Reservation unsuccessfully, only 4 seats for this movie"
    end

    it "Cant create reservation because reservation date is past" do
      params = {
        rdate: "21-12-2010",
        persons: 6
      }
      post "/api/v1/cinemax/movie/#{@movie[:movie_id]}/reservation", params: params
      
      expect(response.status).to eq 201
      expect(response.body).to include "Wrong reservation date, only future functions"
    end

    it "Get reservations" do
      get "/api/v1/cinemax/reservations?date_from=21-12-2020&date_to=25-12-2020"
      expect(response.status).to eq 200
    end
  end
end