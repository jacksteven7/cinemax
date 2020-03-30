module Orm
  class Reservation < Sequel::Model
    many_to_one :movie
    CINEMA_LIMIT = 10
  end
end