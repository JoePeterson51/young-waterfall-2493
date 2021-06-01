studio_1 = Studio.create!(name: "Universal", location: "Hollywood")
movie_1 = studio_1.movies.create!(title: "The Goonies", creation_year: 1985, genre: "Adventure")
movie_2 = studio_1.movies.create!(title: "The Big Lebowski", creation_year: 1998, genre: "Comedy")


