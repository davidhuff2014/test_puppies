Given(/^I am on the frames page$/) do
  visit(FramesPage)
end

When(/^I send the text "([^"]*)"$/) do |text|
  on(FramesPage).send_message(text)
end


Then(/^the receiver should have "([^"]*)"$/) do |expected|
  expect(on(FramesPage).receiver).to eq expected
end