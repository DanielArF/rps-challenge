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
    expect(page).to have_selector "form[action='/play_game']"
    expect(page).to have_selector "input[type='text']"
    expect(page).to have_selector "input[name='username']"
  end

  scenario 'Home page is routing user to ./play_game page entered username and pressed continue' do
    fill_in 'username', :with => 'Daniel'
    click_button 'Continue'
    expect(page.current_path).to eq '/play_game'
    expect(page.status_code).to eq 200
  end

  scenario 'Home page is not routing user to ./play_game page if username is not filled in' do
    fill_in 'username', :with => ""
    click_button 'Continue'
    expect(page.current_path).to eq '/'
  end
end