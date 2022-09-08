require 'rails_helper'
RSpec.describe 'Expense', type: :system do
  describe 'New' do
    before(:all) do
      User.destroy_all
      Group.destroy_all
    end

    before(:each) do
      @user = User.create(name: 'Test', email: 'b@b', password: '123456', confirmed_at: Time.now)
      @user.save
      @group = Group.create(name: 'Test', icon: 'fa-credit-card', user_id: @user.id)
      @group.save
      visit new_user_session_path
      fill_in 'email', with: 'b@b'
      fill_in 'password', with: '123456'
      click_button 'Log in'
      find('.capybara').click
    end

    it 'should show category show page' do
      expect(page).to have_content('TEST')
    end

    it 'should show add transaction button' do
      expect(page).to have_content('Add Transaction')
    end

     it 'should take to new transaction form' do
      click_button 'Add Transaction'
      expect(page).to have_content('NEW TRANSACTION')
    end

     it 'should show name field' do
      click_button 'Add Transaction'
      expect(page).to have_field('Name')
    end

      it 'should show amount field' do
      click_button 'Add Transaction'
      expect(page).to have_field('Amount')
    end

     it 'should show submit button' do
      click_button 'Add Transaction'
      expect(page).to have_button('Add')
    end

  end
end