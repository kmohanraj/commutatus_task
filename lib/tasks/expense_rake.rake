namespace :expense_rake do
	task :create => :environment do
		seed_expense
	end

	def seed_expense
		JSON.parse(open("#{Rails.root}/docs/expenses.json").read).each do |expense_json|
			expense = Expense.new(expense_json)
			expense.save!
		end
	end
end