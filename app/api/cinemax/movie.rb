module Cinemax
  class Movie < Grape::API
    version 'v1', using: :path
    format :json

    resource :cinemax do
      get "movies" do
        movies = DB[:movies].where(Sequel.like(:days, "%#{params[:day]}%"))
        movies = movies.map{ |m| 
          m[:days] =  m[:days].split("|") 
          m
        }
      end
    
      post "movie" do
        movies = DB[:movies]
        movies.insert(:title => params[:title], :description => params[:description], :url => params[:url], :days => params[:days].join("|"))
        { status: "201", message:  "Movie #{params[:title]} created" }
      end

      post "movie/:id/reservation" do
        movie = DB[:movies].where(movie_id: params[:id]).first
        return { status: "401", message: "Movie not found" } if movie.nil?

        reservations = DB[:reservations]
        rdate = Date.parse(params[:rdate])
        persons = params[:persons].to_i
        person_in_reservation = reservations.where(rdate: rdate,movie_id: movie[:movie_id]).sum(:persons).to_i
        reservation_day = Date::DAYNAMES[rdate.wday]
        
        if rdate < Date.today
          { message: "Wrong reservation date, only future functions" }
        elsif movie[:days].exclude? reservation_day
          { message: "#{movie[:title]} is not available on #{reservation_day}s" }
        elsif persons + person_in_reservation > Orm::Reservation::CINEMA_LIMIT #Exceeds the limit of the cinema
          { message: "Reservation unsuccessfully, only #{Orm::Reservation::CINEMA_LIMIT - person_in_reservation} seats for this movie" }
        else
          reservations.insert(:rdate => rdate, :persons => persons, :movie_id =>  params[:id])
          { message: "Reservation created successfully" }
        end
      end    
    end
  end
end