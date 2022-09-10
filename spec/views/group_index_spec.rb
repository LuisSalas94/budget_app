# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Group', type: :system do
  describe 'Index' do
    before(:each) do
      User.create(name: 'Test', email: 'b@b', password: '123456')
      visit new_user_session_path
      fill_in 'Email', with: 'b@b'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'should show groups' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'show show add category button' do
      expect(page).to have_content('ADD CATEGORY')
    end

    it 'should take to new group form' do
      click_button 'Add Category'
      expect(page).to have_content('NEW CATEGORY')
    end
  end
end
