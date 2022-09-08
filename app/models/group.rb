class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expenses
  has_many :expenses, through: :group_expenses

    def total_amount
    fees = group_fees.includes([:fee])
    total = 0
    fees.each do |fee|
      total += fee.fee.amount
    end
    total
  end

end
