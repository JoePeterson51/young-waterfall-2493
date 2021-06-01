require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :actor_movies }
    it { should have_many(:movies).through(:actor_movies)}
  end

  before :each do
      @studio_1 = Studio.create!(name: "Universal", location: "Hollywood")
      @movie_1 = @studio_1.movies.create!(title: "The Goonies", creation_year: 1985, genre: "Adventure")
      @movie_2 = @studio_1.movies.create!(title: "The Big Lebowski", creation_year: 1998, genre: "Comedy")
      @actor_1 = @movie_1.actors.create!(name: "John Guy", age: 24, currently_working: true)
      @actor_2 = @movie_1.actors.create!(name: "Sally Smith", age: 22, currently_working: true)
      @actor_3 = @movie_1.actors.create!(name: "Derik Douglas", age: 30, currently_working: false)
  end

  describe '#find_and_sort' do
    it 'finds the actors that are currently working, sorts by age, and only returns distinct results' do
      actor_ids = Actor.all.map do |actor|
        actor.id
      end
      actors = Actor.find_and_sort(actor_ids)

      expect(actors.count).to eq(2)
      expect(actors.first).to eq("John Guy")
      expect(actors.last).to eq("Sally Smith")
    end
  end
end