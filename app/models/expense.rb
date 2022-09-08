class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_expenses
  has_many :groups, through: :group_expenses
  validates :name, presence: true
  validates :amount, presence: true
  validates :author, presence: true
  validates :groups, presence: true
  
end
