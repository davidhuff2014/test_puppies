Given /^I know how many orders I have$/ do
  @number_orders = Order.count
end

When /^I create a new order$/ do
  order = Order.new
  order.name = 'Cheezy'
  order.address = '123 Main'
  order.email = 'cheezy@example.com'
  order.pay_type = 'Credit Card'
  order.save
end

Then /^I should have (\d+) additional order$/ do |additional_orders|
  expect(Order.count).to eq @number_orders + additional_orders.to_i
end

Given /^I have an order for "([^"]*)"$/ do |name|
  order = Order.new
  order.name = name
  order.address = '123 main'
  order.email = 'cheezy@example.com'
  order.pay_type = 'Credit Card'
  order.save
  @original_name = name
end

When /^I read that order$/ do
  @order = Order.find_by_name(@original_name)
end

Then /^the order should have the name "([^"]*)"$/ do |name|
  expect(@order.name).to eq name
end

When /^I update the name to "([^"]*)"$/ do |name|
  order = Order.find_by_name(@original_name)
  order.name = name
  order.save
end

Then /^I should not have a record for "([^"]*)"$/ do |name|
  order = Order.find_by_name(name)
  expect(order).to be_nil
end

Then /^I should have a record for "([^"]*)"$/ do |name|
  order = Order.find_by_name(name)
  expect(order).to_not be_nil
end

When /^I delete that order$/ do
  order = Order.find_by_name(@original_name)
  order.delete
end
