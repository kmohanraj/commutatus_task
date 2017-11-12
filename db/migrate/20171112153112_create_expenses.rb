class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :desc
      t.date :expense_date
      t.float :amount
      t.integer :category
      t.string :reference

      t.timestamps
    end
  end
end
