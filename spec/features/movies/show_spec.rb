require 'rails_helper'

RSpec.describe Movie, type: :feature do
  describe '#show' do
    before :each do
      @studio_1 = Studio.create!(name: "Universal", location: "Hollywood")
      @movie_1 = @studio_1.movies.create!(title: "The Goonies", creation_year: 1985, genre: "Adventure")
      @movie_1.actors.create!(name: "John Guy", age: 24, currently_working: true)
      @movie_1.actors.create!(name: "Sally Smith", age: 22, currently_working: true)
      @movie_1.actors.create!(name: "Derik Douglas", age: 30, currently_working: false)
    end

    it 'shows the movie title year created genre and actors' do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content("The Goonies")
      expect(page).to have_content(1985)
      expect(page).to have_content("Adventure")
      expect(page).to have_content("John Guy")
      expect(page).to have_content("Sally Smith")
      expect(page).to have_content("Derik Douglas")
    end
  end
end