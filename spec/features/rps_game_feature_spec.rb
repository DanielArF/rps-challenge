require 'spec_helper'

feature 'Game Setup' do

  before (:each) do
    visit '/'
  end

  scenario 'Home page gets status code 200' do
    expect(page.status_code).to be 200
  end

  scenario 'Home page has Welcome to Rock Paper Scissors' do
    expect(page).to have_content "Welcome to Rock Paper Scissors"
  end

  scenario 'Home page displays username input form' do
    expect(page).to have_selector "from[action='/play_game']"
    expect(page).to have_selector "input[type='text']"
    expect(page).to have_selector "input[name='username']"
  end

end