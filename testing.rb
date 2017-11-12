require "rubygems"
require "test/unit"
require "watir"
require "watir-webdriver"



class FinanceTesting < Test::Unit::TestCase

  puts "Testing for INVALID USER...."

  VALID_USERS = {customer_name: "example@gmail.com", desc: "password", amount: 500}

  URL = "http://localhost:3000"

  def setup
    @browser ||= Watir::Browser.new :firefox
  end

  def teardown
    sleep 2
    @browser.close
  end

  def test_search
    @browser.goto URL
    @browser.button(id: "add-new-bill").click
    # =======================This is for invalid user ======================
      @browser.text_field(id: "finance_name").set VALID_USERS[:customer_name]
      @browser.text_field(id: "finance_desc").set VALID_USERS[:desc]
      @browser.select_field(id: "finance_amount").set VALID_USERS[:amount]
      # @browser.text_field(id: "finance_category").select  INVALID_USERS[:password] # For password field tag we can use text field tag itself.

      # Form submit button
      @browser.button(id: "new-bil-submit").click
    #=========================================================================
  end

  puts "Bye, Go to next file..."
end
