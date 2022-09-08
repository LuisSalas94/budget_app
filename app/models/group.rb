class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expenses
  has_many :expenses, through: :group_expenses

    def total_amount
    expenses = group_expenses.includes([:expense])
    total = 0
    expenses.each do |expense|
      total += expense.expense.amount
    end
    total
  end

  validates :name, presence: true
  validates :icon, presence: true
end
