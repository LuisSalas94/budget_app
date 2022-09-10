# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'John Doe', email: 'a@a', password: '123456')
    end

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end
  end
end
