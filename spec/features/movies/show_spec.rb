require 'rails_helper'
RSpec.describe 'Movies Show Page' do
  before :each do
    @marvel = Studio.create!(name: 'Marvel', location: 'New York City')
    @avengers = @marvel.movies.create!(title: 'Avengers', creation_year: 2012, genre: 'Superhero/Adventure')
    @downey = Actor.create!(name: 'Robert Downey Jr.', age: 56)
    @evans = Actor.create!(name: 'Chris Evans', age: 40)
    @johansson = Actor.create!(name: 'Scarlett Johansson', age: 36)
    @paltrow = Actor.create!(name: 'Gwyneth Paltrow', age: 48)

    @avengers.actors << @downey
    @avengers.actors << @evans
    @avengers.actors << @johansson
    @avengers.actors << @paltrow

    visit "/movies/#{@avengers.id}"
  end

  it 'shows a movie and attributes' do
    expect(page).to have_content(@avengers.title)
    expect(page).to have_content(@avengers.creation_year)
    expect(page).to have_content(@avengers.genre)
  end

  it 'lists actors in movie by age' do
    expect(page).to have_css("#actor-#{@johansson.id} ~ #actor-#{@evans.id}")
    expect(page).to have_css("#actor-#{@evans.id} ~ #actor-#{@paltrow.id}")
    expect(page).to have_css("#actor-#{@paltrow.id} ~ #actor-#{@downey.id}")
  end

  it 'shows average age of actors' do
    expect(page).to have_content('Actors Average Age: 45')
  end
end
