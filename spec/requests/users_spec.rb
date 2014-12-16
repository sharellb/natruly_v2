require 'rails_helper'

RSpec.describe User, :type => :request do
  describe 'User registration' do
  	it 'allows a user to register' do
  		visit '/users/sign_up'
  		fill_in 'Email', :with => 'user@example.com'
  		fill_in 'Password', :with => 'password'
  		fill_in 'Password confirmation', :with => 'password'

  		click_button 'Sign up'
  		expect(page).to have_content('Welcome to Natruly!')
  	end
  end

  describe 'User sign in' do
    it 'allows users to sign in' do
      user = FactoryGirl.create(:user)
      visit '/users/sign_in'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'

      click_button 'Log in'
      expect(page).to have_content('Welcome to Natruly!')
    end
  end
end