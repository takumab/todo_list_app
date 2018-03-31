require 'rails_helper'

RSpec.describe User, type: :feature do

  describe 'sign up' do

    it 'sign up' do
      # Jane visits todolistapp.com in order to create a todo list
      visit root_path
      # She notices that she is not signed up
      # Sees the sign up and log in link
      expect(page).to have_content('Sign Up')
      # Jane clicks on the sign up link to sign up.
      click_link('Sign Up')
    end
  end
end
