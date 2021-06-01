require 'rails_helper'

RSpec.describe ActorMovie, type: :model do
  describe 'relationships' do
    it { should belong_to :actor }
    it { should belong_to :movie }
  end

  before :each do
      @studio_1 = Studio.create!(name: "Universal", location: "Hollywood")
      @movie_1 = @studio_1.movies.create!(title: "The Goonies", creation_year: 1985, genre: "Adventure")
      @movie_2 = @studio_1.movies.create!(title: "The Big Lebowski", creation_year: 1998, genre: "Comedy")
      @movie_1.actors.create!(name: "John Guy", age: 24, currently_working: true)
      @movie_1.actors.create!(name: "Sally Smith", age: 22, currently_working: true)
      @movie_1.actors.create!(name: "Derik Douglas", age: 30, currently_working: false)
  end

  describe "#find_actor_movies" do
    it 'finds the actor movies' do
      movie_ids = @studio_1.movies.pluck(:id)

      actor_movies = ActorMovie.find_actor_movies(movie_ids)

      expect(actor_movies.first.movie_id).to eq(@movie_1.id)
    end
  end
end