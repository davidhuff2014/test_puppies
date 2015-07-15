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