class Expense < ApplicationRecord
	before_validation :set_expense_date, on: :create
	
	before_validation :set_reference, on: :create



	enum category: [:incomes, :expenses]
	ENUM_ENTITY = {"incomes" => 0, "expenses" => 1}

	scope :finance_expense, -> { where(:category=>1) }
    scope :today, -> { where(:expense_date => Date.today, :category=>1)}
	scope :expense_date, -> { where("? BETWEEN startDate AND endDate", Date.today)}

	def set_expense_date
		self.expense_date = Date.today if self.expense_date.blank?
	end


	def set_reference
		#have to write reference name logic
		self.reference =  "CES/OWB/#{Date.today.strftime('%y')}-#{(Date.today + 1.year).strftime('%y')}/#{Date.today.strftime('%m')} #{rand(999)}" if self.reference.blank?
	end

	def self.search(bill)
	    if bill
	      where('expense_date LIKE ? ' , "%#{bill}%").having("expenses.category = 1")
	    else
	      all
	    end
  	end
end
