require 'rails_helper'

RSpec.describe LandingPage: :Index do
  it 'has a landing page with a title' do
    visit root_path

    expect(page).to have_content('Viewing Party!!(lite)')
  end

  it 'contains a link to register for the service' do
    visit root_path

    expect(page).to have_button('Create an Account')

    click_on('Create an Account')

    expect(current_path).to eq('/register')
  end

  xit 'contains a list of all users that link to the users show page' do
    user1 = User.create!(name: 'Jim', email: 'Jimmyb@gmail.com', password: 'test123', password_confirmation: 'test123')
    user2 = User.create!(name: 'John', email: 'johnnybgud@gmail.com', password: 'test123', password_confirmation: 'test123')

    visit root_path

    expect(page).to have_link("Jim's Dashboard")
    expect(page).to have_link("John's Dashboard")

    click_link "Jim's Dashboard"

    expect(current_path).to eq('/dashboard')
  end

  it 'prints a list of users emails' do
    user1 = User.create!(name: 'Jim', email: 'Jimmyb@gmail.com', password: 'test123', password_confirmation: 'test123')
    user2 = User.create!(name: 'John', email: 'johnnybgud@gmail.com', password: 'test123', password_confirmation: 'test123')

    visit root_path

    expect(page).to have_content('Jimmyb@gmail.com')
    expect(page).to have_content('johnnybgud@gmail.com')
  end
end
