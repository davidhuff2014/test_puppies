When(/^I open my shows xml$/) do
  # the_file = File.open('shows.xml')
  # @xml_doc = Nokogiri::XML(the_file)
  # the_file.close
  file = File.open('shows.xml')
  @xml = Nokogiri::XML(file)
  file.close
end

Then(/^I should see (\d+) sitcoms$/) do |num_sitcoms|
  # sitcom = @xml_doc.xpath('//sitcom')
  # sitcom.count
  expect(@xml.xpath('//sitcom').length).to eq num_sitcoms.to_i
end

Then(/^I should see (\d+) drama$/) do |num_dramas|
  # drama = @xml_doc.xpath('//drama')
  # drama.count
  expect(@xml.xpath('//drama').length).to eq num_dramas.to_i
end
