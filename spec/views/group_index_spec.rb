require 'rails_helper'
RSpec.describe 'Group', type: :system do
  describe 'Index' do
    before(:each) do
      User.create(name: 'Test', email: 'test@gmail.com', password: '123456')
      visit new_user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end
  
    it 'It should show groups name' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'It show add category button name' do
      expect(page).to have_content('ADD CATEGORY')
    end

    it 'should take to new group form' do
      click_button 'Add Category'
      expect(page).to have_content('NEW CATEGORY')
    end
  end
end
