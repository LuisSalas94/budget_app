require 'rails_helper'
RSpec.describe 'Expense', type: :system do
  describe 'New' do
    before(:all) do
      User.destroy_all
      Group.destroy_all
    end

    before(:each) do
      @user = User.create(name: 'Test', email: 'b@b', password: '123456')
      @user.save
      @group = Group.create(name: 'Test', icon: 'fa-credit-card', user_id: @user.id)
      @group.save
      visit new_user_session_path
      fill_in 'Email', with: 'b@b'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      find('.tran_data').click
    end

    before(:all) do
      driven_by(:selenium_chrome_headless)
    end

    it 'should show category show page' do
      expect(page).to have_content('TEST DETAILS')
      expect(page).to have_content('Log out')
      click_button 'Add Transaction'
      expect(page).to have_field('Name')
      expect(page).to have_field('Amount')
      expect(page).to have_button('Add')
      fill_in 'Name', with: 'Test Transaction'
      fill_in 'Amount', with: '100'
      click_button 'Add'
      expect(page).to have_content('Test Transaction')
      expect(page).to have_content('TEST DETAILS')
    end
  end
end
