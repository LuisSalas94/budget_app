# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Group, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'John Doe', email: 'a@a', password: '123456')
      @group = Group.new(name: 'Group 1', icon: 'icon.png', user: @user)
    end

    it 'is valid with valid attributes' do
      expect(@group).to be_valid
    end

    it 'is not valid without a name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'is not valid without an icon' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end

    it 'is not valid without a user' do
      @group.user = nil
      expect(@group).to_not be_valid
    end

    it 'is not valid without a user' do
      @group.user = nil
      expect(@group).to_not be_valid
    end
  end
end
