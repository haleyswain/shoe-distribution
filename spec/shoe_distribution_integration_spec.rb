require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a shoe store', {:type => :feature}) do
    it('gathers the user shoe store input and displays it in the list of shoe stores') do
      visit('/')
      click_link('Click here to view a list of our stores')
      fill_in('name', :with => 'shoe store')
      click_button('Add store')
      expect(page).to have_content('Shoe Store')
    end
  end

  describe('adding a shoe brand', {:type => :feature}) do
    it('gathers the user input for shoe brand and displays it in the list of shoe brands') do
      visit('/')
      click_link('Click here to view a list of our shoe brands')
      fill_in('new_brand', :with => 'keen')
      click_button('Add a new brand')
      expect(page).to have_content('Keen')
    end
  end

  describe('deleting a shoe store', {:type => :feature}) do
    it('deletes a shoe store from the list of shoe stores') do
      visit('/')
      click_link('Click here to view a list of our stores')
      fill_in('name', :with => 'clog store')
      click_button('Add store')
      expect(page).to have_content('Clog Store')
      click_link('Clog Store')
      click_button('Delete this Store')
      expect(page).not_to have_content('Clog Store')
    end
  end
