movies = DB[:movies]
movies.insert(:title => 'Pirates of the Caribbean', :description => 'Adventure', :url => 'shorturl.at/rEU06', :days => "Monday|Wednesday|Friday")
movies.insert(:title => 'Saw', :description => 'Thriller', :url => 'shorturl.at/ruxAG', :days => "Tuesday|Thursday|Saturday|Sunday")
movies.insert(:title => 'Purge', :description => 'Thriller', :url => 'shorturl.at/crEZ0', :days => "Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday")