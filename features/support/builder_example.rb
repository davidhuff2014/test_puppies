require 'builder'
require 'faker'

# builder = Builder::XmlMarkup.new(:target=>STDOUT, :indent=>2)
file = File.new('name_and_phone.xml', 'wb')
builder = Builder::XmlMarkup.new :target => file

xml = builder.contacts do
  xml = builder.contact do |c|
    c.name Faker::Name.name
    c.phone Faker::PhoneNumber.phone_number
  end
  xml = builder.contact do |c|
    c.name Faker::Name.name
    c.phone Faker::PhoneNumber.phone_number
  end
  xml = builder.contact do |c|
    c.name Faker::Name.name
    c.phone Faker::PhoneNumber.phone_number
  end
  xml = builder.contact do |c|
    c.name Faker::Name.name
    c.phone Faker::PhoneNumber.phone_number
  end
  xml = builder.contact do |c|
    c.name Faker::Name.name
    c.phone Faker::PhoneNumber.phone_number
  end
end

file.close