When(/^I ask the service for the supported operations$/) do
  @operations = using(ZipCodeInformationService).operations
end

Then(/^"([^"]*)" should be supported$/) do |operation|
  expect(@operations).to include operation.to_sym
end

When(/^I ask for the zip code information for "([^"]*)"$/) do |zip_code|
  using(ZipCodeInformationService).get_info_by_zip('USZip' => zip_code)
end

Then(/^I should get the following information$/) do |table|
  expected = table.hashes.first
  using(ZipCodeInformationService) do |service|
    expect(service.city).to eq expected['city']
    expect(service.state).to eq expected['state']
    expect(service.area_code).to eq expected['area_code']
    expect(service.time_zone).to eq expected['time_zone']
  end
end
