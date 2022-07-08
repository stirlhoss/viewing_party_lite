require 'rails_helper'

RSpec.describe MovieService do
  describe 'top_movies endpoint' do
    it 'gets top_movies JSON and parses into hash', :vcr do
      response = MovieService.top_rated


      expect(response).to be_a Hash
      expect(response[:results]).to be_a Array
      expect(response[:results].count).to eq 20

      first_movie = response[:results][0]

      expect(first_movie).to have_key :title
      expect(first_movie).to have_key :overview
      expect(first_movie).to have_key :vote_average
    end
  end
end
