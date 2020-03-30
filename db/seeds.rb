# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
movies = DB[:movies]
movies.insert(:title => 'Pirates of the Caribbean', :description => 'Adventure', :url => 'shorturl.at/rEU06', :days => "Monday|Wednesday|Friday")
movies.insert(:title => 'Saw', :description => 'Thriller', :url => 'shorturl.at/ruxAG', :days => "Tuesday|Thursday|Saturday|Sunday")
movies.insert(:title => 'Purge', :description => 'Thriller', :url => 'shorturl.at/crEZ0', :days => "Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday")