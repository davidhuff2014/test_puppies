require 'builder'
require 'faker'

builder = Builder::XmlMarkup.new(:target=>STDOUT, :indent=>2)
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