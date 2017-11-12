class ExpensesController < ApplicationController
		before_action :set_new_expense, only: [:index]


	def index
        expenses = Expense.search(params[:bill])
		expenses = Expense.finance_expense if params[:bill] == "finance_expense"
		expenses = Expense.today if params[:bill] == "today"
	    expenses  = Expense.all if params[:bill].nil?
		@expenses = expenses.paginate(page: params[:page]).order("created_at DESC")
		respond_to do |format|
		format.html
		format.json {render json: @expenses, status: :ok}
		end 
	end

	def create
		@expense_created = Expense.new(name: params[:expense][:name], desc: params[:expense][:desc], category: params[:category].to_i, amount: params[:expense][:amount])
		# @finance_created = Finance.new(finance_params)
		respond_to do |format|
		  if @expense_created.save
			format.json {render json: @expense_created, status: :created}
			format.js
			format.html {redirect_to root_path, flash: {success: "Expense Saved Successfully"}}
		  else
			format.json {render json: @expense_created.errors.full_messages, status: :unprocessable_entity}
			format.js
			format.html {redirect_to expenses_path, flash: {error: @expense_created.errors.full_messages}}
		  end
		end
	end


	private

	def finance_params(params)
		params.require(:expense).permit(:name, :desc, :amount, :category, :reference )
	end

	def set_new_expense
		@expense = Expense.new
	end

end
