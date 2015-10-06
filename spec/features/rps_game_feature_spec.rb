require 'spec_helper'

describe 'Rock Paper Scissors'do

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

  feature 'Play Game' do

    before(:each) do
      visit '/'
      fill_in 'username', :with => 'Daniel'
      click_button 'Continue'
    end

    scenario 'Play game gets status code 200' do
      expect(page.status_code).to be 200
    end

    scenario 'Play game page displays input options with rock paper scissors' do
      expect(page).to have_selector "form[action='/result']"
      expect(page).to have_selector "input[type='radio']"
      expect(page).to have_selector "input[value='rock']"
      expect(page).to have_selector "input[value='paper']"
      expect(page).to have_selector "input[value='scissors']"
    end

    scenario 'Play game page presents three choices rock paper scissors' do
      expect(page).to have_content 'Rock'
      expect(page).to have_content 'Paper'
      expect(page).to have_content 'Scissors'
    end

    scenario 'Play game page is routing user to ./result page after chosen player_move and click play' do
      #byebug
      choose('player_move_rock')
      click_button 'Play'
      expect(page.current_path).to eq'/result'
      expect(page.status_code).to eq 200
    end
  end
end