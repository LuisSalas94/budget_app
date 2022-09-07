class ExpensesController < ApplicationController
   def new
    @group = Group.find(params[:group_id])
    @title = 'New Transaction'
  end

  def create
    @expense = Expense.new(expense_params)
    @group = Group.find(params[:expense][:group_id])
    if @expense.save
      @group.group_expenses.create(expense_id: @expense.id)
      redirect_to group_url(@group)
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :author_id)
  end
end
