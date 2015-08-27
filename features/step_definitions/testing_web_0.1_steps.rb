Given(/^I am on the frames page$/) do
  visit(FramesPage)
end

When(/^I send the text "([^"]*)"$/) do |text|
  on(FramesPage).send_message(text)
end


Then(/^the receiver should have "([^"]*)"$/) do |expected|
  expect(on(FramesPage).receiver).to eq expected
end

When(/^I popup the alert$/) do
  on(FramesPage) do |page|
    @alert_text = page.alert_text
  end
end

Then(/^the text from the alert should read "([^"]*)"$/) do |expected|
  expect(@alert_text).to eq expected
end

When(/^I popup the confirm$/) do
  on(FramesPage) do |page|
    @confirm_text = page.confirm_text
  end
end

Then(/^the text from the confirm should read "([^"]*)"$/) do |expected|
  expect(@confirm_text).to eq expected
end

When(/^I popup the prompt and enter "([^"]*)"$/) do |value_to_enter|
  on(FramesPage) do |page|
    @prompt_response = page.prompt_value(value_to_enter)
  end
end

Then(/^the message from the prompt should read "([^"]*)"$/) do |message|
  expect(@prompt_response[:message]).to eq message
end

And(/^the default value from the prompt should be "([^"]*)"$/) do |default|
  expect(@prompt_response[:default_value]).to eq default
end