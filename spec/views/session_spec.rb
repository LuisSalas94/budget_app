# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session', type: :system do
  describe 'Login' do
    before(:each) do
      User.create(name: 'Test', email: 'b@b', password: '123456', confirmed_at: Time.now)
      visit new_user_session_path
    end

    it 'should show login form' do
      expect(page).to have_content('Log in')
    end

    it 'should show email field' do
      expect(page).to have_field('Email')
    end

    it 'should show password field' do
      expect(page).to have_field('Password')
    end
  end
end
