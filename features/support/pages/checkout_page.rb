require_relative 'error_panel'
require_relative 'side_menu_panel'

class CheckoutPage

  include PageObject
  include DataMagic
  include ErrorPanel
  include SideMenuPanel

  # DEFAULT_DATA = {
  #     name: 'cheezy',
  #     address: '123 Main Street',
  #     email: 'cheeezy@example.com',
  #     pay_type: 'Purchase order'
  # }


  # def initialize(browser)
  #   @browser = browser
  # end

  # def name=(name)
  #   @browser.text_field(id: "order_name").set(name)
  # end

  text_field(:name, id: 'order_name')


  # def address=(address)
  #   @browser.textarea(id: "order_address").set(address)
  # end

  textarea(:address, id: 'order_address')

  # def email=(email)
  #   @browser.text_field(id: "order_email").set(email)
  # end

  text_field(:email, id: 'order_email')

  # def pay_type=(pay_type)
  #   @browser.select_list(id: "order_pay_type").select(pay_type)
  # end

  select_list(:pay_type, id: 'order_pay_type')

  # def place_order
  #   @browser.button(value: "Place Order").click
  # end

  button(:place_order, value: 'Place Order')

  # def checkout(data = {})
  #   data = DEFAULT_DATA.merge(data)
  #   self.name = data['name']
  #   self.address = data['address']
  #   self.email = data['email']
  #   self.pay_type = data['pay_type']
  #   place_order
  # end

  def checkout(data = {})
    # populate_page_with DEFAULT_DATA.merge(data)
    populate_page_with data_for(:checkout_page, data)
    place_order
  end

  # div(:error_div, :id => 'error_explanation')
  # unordered_list(:error_messages) do |page|
  #   page.error_div_element.unordered_list_element
  # end
end