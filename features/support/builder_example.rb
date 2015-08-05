require 'builder'
require 'faker'

# builder = Builder::XmlMarkup.new(:target=>STDOUT, :indent=>2)
file = File.new('../../name_and_phone.xml', 'wb')
builder = Builder::XmlMarkup.new :target => file, :indent => 2

xml = builder.contacts do
  50.times do
    xml = builder.contact do |c|
      c.name Faker::Name.name
      c.phone Faker::PhoneNumber.phone_number
    end
  end
end

file.close