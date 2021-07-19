require 'rails_helper'
RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through(:movie_actors) }
  end
  # describe 'validations' do
  #   it { should validate_presence_of(:) }
  # end
  # before :each do
  #
  # end
  # describe 'class methods' do
  #   describe '.' do
  #   end
  # end
  # describe 'instance methods' do
  #   describe '#' do
  #   end
  # end
end
