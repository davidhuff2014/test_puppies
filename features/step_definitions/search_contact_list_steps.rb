Given(/^I have a phone book:$/) do |table|
  builder = Builder::XmlMarkup.new
  @xml = builder.contacts do |contacts|
    table.hashes.each do |row|
      contacts.contact do |contact|
        contact.name row['name']
        contact.phone row['phone']
      end
    end
  end
end

When(/^I look up the phone number for "([^"]*)"$/) do |name|
  doc = Nokogiri::XML(@xml)
  contacts =  doc.xpath('//contact')
  @node = contacts.find { |row | row.content.include? name }
end

Then(/^I should see the phone number "([^"]*)"$/) do |phone_number|
  expect(@node.at_xpath('//phone').content).to eq phone_number
end
