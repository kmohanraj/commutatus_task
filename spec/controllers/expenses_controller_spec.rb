require 'rails_helper'

require 'spec_helper'
require 'webrat'

RSpec.describe ExpensesController, type: :controller do

  describe "index action" do
  	before do 
   		Factory = Expense.new
 	end

    before(:each) do
      Date.stub(:today).and_return(Date.new(2017, 11, 10))
      # @another_user = Factory(:user)
      # @altro = Factory(:category, :name => "Altro", :user => @user)
      # @another_category = Factory(:category, :name => "Another category", :user => @another_user)
      @first = Factory(:expense,
        :name => "tony",
        :desc => "First",
        :amount => -100,
        :expense_date => Date.new(2017,11,10),
        :category => "expenses")
      @second = Factory(:expense,
        :name => "krish",
        :desc => "Second",
        :amount => 200,
        :date => Date.new(2017,11,10),
        :category => "incomes")
      @third = Factory(:expense,
        :name => "jack",
        :desc => "Third",
        :amount => 500,
        :date => Date.new(2017,11,10),
        :category => "expenses")
    end

    it "should receive a success response and show all the entries" do
      get :index
      response.should be_success
      assigns[:expenses].should eql [@first]
    end

    it "should show only the entries for a given month" do
      get :index, :year => 2017, :month => 11
      response.should be_success
      assigns[:incomes].should eql [@second]
    end

    it "should show only the entries for a given month and category" do
      @user.stub(:expenses_by_year_month_and_category).and_return([])
      get :index, :year => 2017, :month => 11, :category_name => "A category without expenses"
      response.should be_success
      assigns[:expenses].should have(0).expenses
    end

    # it "should map categories only for current user" do
    #   get :index, :year => 2009, :month => 2
    #   assigns[:categories].should_not include "Another category"
    # end

  end

end
