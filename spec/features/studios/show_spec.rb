require 'rails_helper'

RSpec.describe Studio, type: :feature do
  describe '#show' do
    before :each do
      @studio_1 = Studio.create!(name: "Universal", location: "Hollywood")
      @studio_1.movies.create!(title: "The Goonies", creation_year: 1985, genre: "Adventure")
      @studio_1.movies.create!(title: "The Big Lebowski", creation_year: 1998, genre: "Comedy")
    end

    it 'shows the studios name, location, and its movies' do
      visit "/studios/#{@studio_1.id}"

      expect(page).to have_content("Universal")
      expect(page).to have_content("Hollywood")
      expect(page).to have_content("The Goonies")
      expect(page).to have_content("The Big Lebowski")
    end
  end
end
