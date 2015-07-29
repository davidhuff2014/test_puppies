Given(/^I am on the puppy adoption site$/) do
  # @browser.goto'http://puppies.herokuapp.com'
  # @home = HomePage.new(@browser)
  # @details = DetailsPage.new(@browser)
  visit(HomePage)
end

When(/^I click the View Details button for "([^"]*)"$/) do |name|
  # @browser.button(value: 'View Details', index: 0).click
  # @home.select_puppy_number 1
  # @details = DetailsPage.new(@browser)
  # on(HomePage).select_puppy_number 1
  on(HomePage).select_puppy name
end

When(/^I click the Adopt Me button$/) do
  # @browser.button(value: 'Adopt Me!').click
  # @details.add_to_cart
  # @cart = ShoppingCartPage.new(@browser)
  on(DetailsPage).add_to_cart
end

When(/^I click the Adopt Another Puppy button$/) do
  # @cart.continue_shopping
  on(ShoppingCartPage).continue_shopping
end

# When(/^I click the second View Details button$/) do
#   # @browser.button(value: 'View Details', index: 1).click
#   # @home.select_puppy_number 2
#   # @details = DetailsPage.new(@browser)
#   on(HomePage).select_puppy_number 2
# end

When(/^I click the Complete the Adoption button$/) do
  # @cart.proceed_to_checkout
  # @checkout = CheckoutPage.new(@browser)
  on(ShoppingCartPage).proceed_to_checkout
end

When(/^I enter "([^"]*)" in the name field$/) do |name|
  # @browser.text_field(id: 'order_name').set(name)
  # @checkout.name = name
  on(CheckoutPage).name = name
end

When(/^I enter "([^"]*)" in the address field$/) do |address|
  # @browser.textarea(id: 'order_address').set(address)
  # @checkout.address = address
  on(CheckoutPage).address = address
end

When(/^I enter "([^"]*)" in the email field$/) do |email|
  # @browser.text_field(id: 'order_email').set(email)
  # @checkout.email = email
  on(CheckoutPage).email = email
end


When(/^I select "([^"]*)" from the pay with dropdown$/) do |pay_type|
  # @browser.select_list(id: 'order_pay_type').select(pay_type)
  # @checkout.pay_type = pay_type
  on(CheckoutPage).pay_type = pay_type
end

When(/^I click Place Order button$/) do
  # @browser.button(value: 'Place Order').click
  # @checkout.place_order
  on(CheckoutPage).place_order
end

Then(/^I should see "([^"]*)"$/) do |expected|
  # expect(@browser.text).to include expected
  expect(@current_page.text).to include expected
end

# Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |name, line_item|
Then /^I should see "([^"]*)" as the name for (line item \d+)$/ do |name, line_item|
  # expect(@cart.name_for_line_item(line_item)).to include name
  expect(on(ShoppingCartPage).name_for_line_item(line_item)).to include name
end

Then(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |subtotal, line_item|
  # expect(@cart.subtotal_for_line_item(line_item)).to eql subtotal
  expect(on(ShoppingCartPage).subtotal_for_line_item(line_item)).to eq subtotal
end

Then(/^I should see "([^"]*)" as the cart total$/) do |total|
  # expect(@cart.cart_total).to eql total
  expect(on(ShoppingCartPage).cart_total).to eq total
end

When(/^I complete the adoption with:$/) do |table|
  on(CheckoutPage).checkout(table.hashes.first)
end

When /^I complete the adoption$/ do
  on(CheckoutPage).checkout
end

# When /^I complete the adoption of a puppy$/ do
#   on(HomePage).select_puppy
#   on(DetailsPage).add_to_cart
#   on(ShoppingCartPage).proceed_to_checkout
#   on(CheckoutPage).checkout
# end

When /^I complete the adoption of a puppy$/ do
  navagate_all
end

When(/^I complete the adoption using a Credit card$/) do
  on(CheckoutPage).checkout('pay_type' => 'Credit card')
end

# When /^I checkout leaving the name field blank$/ do
#   on(HomePage).select_puppy
#   on(DetailsPage).add_to_cart
#   on(ShoppingCartPage).proceed_to_checkout
#   on(CheckoutPage).checkout(name: '')
# end

When /^I checkout leaving the name field blank$/ do
  navigate_to(CheckoutPage).checkout(name: '')
end

Then /^I should see the error message "([^"]*)"$/ do |msg|
  # expect(@current_page.error_messages).to include msg
  expect(@current_page).to have_error_message msg
end

# Given(/^I have a pending adoption for "([^"]*)"$/) do |name|
#   on(HomePage).select_puppy
#   on(DetailsPage).add_to_cart
#   on(ShoppingCartPage).proceed_to_checkout
#   on(CheckoutPage).checkout('name' => name)
# end

Given /^I have a pending adoption for "([^"]*)"$/ do |name|
  navigate_to(CheckoutPage).checkout('name' => name)
end

# cannot find any way to make this work continuing to use
# the above
# Given /^I have a pending adoption for "([^"]*)"$/ do |name|
#   order = build(:order, :name => name)
#   create(:adoption, :order => order)
# end

When(/^I process that adoption$/) do
  visit(LandingPage)
  on(LoginPage).login_to_system
  on(LandingPage).adoptions
  on(ProcessPuppyPage).process_first_puppy
end

Then /^the adoption delivered on date should be set to the current time$/ do
  adoption = Adoption.first
  expect(adoption.delivered_on).to be_on_or_near_the_time Time.now
end

