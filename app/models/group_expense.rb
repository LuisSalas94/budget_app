# frozen_string_literal: true

class GroupExpense < ApplicationRecord
  belongs_to :expense
  belongs_to :group
end
