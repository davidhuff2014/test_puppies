When(/^I ask the service for the supported operations$/) do
  @operations = using(ZipCodeInformationService).operations
end

Then(/^"([^"]*)" should be supported$/) do |operation|
  expect(@operations).to include operation.to_sym
end
