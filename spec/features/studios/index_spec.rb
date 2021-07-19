require 'rails_helper'
RSpec.describe 'Studio Index Page' do
  before :each do
    @pixar = Studio.create!(name: 'Pixar', location: 'Emeryville')
    @marvel = Studio.create!(name: 'Marvel', location: 'New York City')
    @lucasfilm = Studio.create!(name: 'Lucasfilm', location: 'San Francisco')
    @toy_story = @pixar.movies.create!(title: 'Toy Story', creation_year: 1995, genre: 'Childrens')
    @nemo = @pixar.movies.create!(title: 'Finding Nemo', creation_year: 2003, genre: 'Childrens')
    @coco = @pixar.movies.create!(title: 'Coco', creation_year: 2017, genre: 'Childrens')
    @avengers = @marvel.movies.create!(title: 'Avengers', creation_year: 2012, genre: 'Superhero/Adventure')
    @iron_man = @marvel.movies.create!(title: 'Iron Man', creation_year: 2008, genre: 'Superhero/Adventure')
    @captain_america = @marvel.movies.create!(title: 'Captain America', creation_year: 2011, genre: 'Superhero/Adventure')
    @new_hope = @lucasfilm.movies.create!(title: 'Star Wars: Empire Strikes Back', creation_year: 1977, genre: 'Sci-Fi/Action')
    @empire = @lucasfilm.movies.create!(title: 'Star Wars: Empire Strikes Back', creation_year: 1980, genre: 'Sci-Fi/Action')
    @return = @lucasfilm.movies.create!(title: 'Star Wars: Return of the Jedi', creation_year: 1983, genre: 'Sci-Fi/Action')
    visit "/studios"
  end
  it 'lists all studios and locations' do
    expect(page).to have_content(@pixar.name)
    expect(page).to have_content(@pixar.location)
    expect(page).to have_content(@marvel.name)
    expect(page).to have_content(@marvel.location)
    expect(page).to have_content(@lucasfilm.name)
    expect(page).to have_content(@lucasfilm.location)
  end
  it 'lists all movie titles made at studio' do
    within("#studio-#{@pixar.id}") do
      expect(page).to have_content(@toy_story.title)
      expect(page).to have_content(@nemo.title)
      expect(page).to have_content(@coco.title)
    end

    within("#studio-#{@marvel.id}") do
      expect(page).to have_content(@avengers.title)
      expect(page).to have_content(@iron_man.title)
      expect(page).to have_content(@captain_america.title)
    end

    within("#studio-#{@lucasfilm.id}") do
      expect(page).to have_content(@new_hope.title)
      expect(page).to have_content(@empire.title)
      expect(page).to have_content(@return.title)
    end
  end
end
