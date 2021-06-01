studio_1 = Studio.create!(name: "Universal", location: "Hollywood")
movie_1 = studio_1.movies.create!(title: "The Goonies", creation_year: 1985, genre: "Adventure")
movie_2 = studio_1.movies.create!(title: "The Big Lebowski", creation_year: 1998, genre: "Comedy")
movie_1.actors.create!(name: "John Guy", age: 24, currently_working: true)
movie_1.actors.create!(name: "Sally Smith", age: 22, currently_working: true)
movie_2.actors.create!(name: "Sally Smith", age: 22, currently_working: true)
movie_2.actors.create!(name: "Derik Douglas", age: 30, currently_working: false)


