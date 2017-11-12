FactoryGirl.define do
  factory :expense do
    name "MyString"
    desc "MyString"
    expense_date "2017-11-12"
    amount 1.5
    category 1
    reference "MyString"
  end
end
