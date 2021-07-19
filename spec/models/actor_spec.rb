require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe 'class methods' do
    before :each do
      @downey = Actor.create!(name: 'Robert Downey Jr.', age: 56)
      @evans = Actor.create!(name: 'Chris Evans', age: 40)
    end

    describe '.order_by_age' do
      it 'can order actors by age' do

        expect(Actor.order_by_age).to eq([@evans, @downey])
      end
    end

    describe '.average_age' do
      it 'can return average age of all actors' do
        expect(Actor.average_age).to eq(48)
      end
    end
  end
end
