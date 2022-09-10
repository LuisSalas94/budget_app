# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'John Doe', email: 'a@a', password: '123456', confirmed_at: Time.now)
      @group = Group.new(name: 'Group 1', icon: 'icon.png', user: @user)
      @expense = Expense.new(name: 'Fee 1', amount: 10, author: @user)
    end

    it 'is valid with valid attributes' do
      expect(@expense).to be_valid
    end

    it 'is not valid without a name' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it 'is not valid without an amount' do
      @expense.amount = nil
      expect(@expense).to_not be_valid
    end

    it 'is not valid without an author' do
      @expense.author = nil
      expect(@expense).to_not be_valid
    end
  end
end
