require_relative 'error_panel'
require_relative 'side_menu_panel'

class ShoppingCartPage

  include PageObject
  include ErrorPanel
  include SideMenuPanel

  NAME_COLUMN = 1 unless const_defined?(:NAME_COLUMN)

  SUBTOTAL_COLUMN = 3 unless const_defined?(:SUBTOTAL_COLUMN)

  LINES_PER_PUPPY = 6 unless const_defined?(:LINES_PER_PUPPY)

  # def initialize(browser)
  #   @browser = browser
  # end

  # def name_for_line_item(line_item)
  #   cart_line_item(line_item)[NAME_COLUMN].text
  # end

  def name_for_line_item(line_item)
    table_value(line_item, NAME_COLUMN)
  end

  # def subtotal_for_line_item(line_item)
  #   cart_line_item(line_item)[SUBTOTAL_COLUMN].text
  # end

  def subtotal_for_line_item(line_item)
    table_value(line_item, SUBTOTAL_COLUMN)
  end


  # def cart_total
  #   @browser.td(class: 'total_cell').text
  # end

  table(:cart, index: 0)
  cell(:cart_total, class: 'total_cell')

  # def proceed_to_checkout
  #   @browser.button(value: 'Complete the Adoption').click
  # end

  button(:proceed_to_checkout, value: 'Complete the Adoption')

  # def continue_shopping
  #   @browser.button(value: 'Adopt Another Puppy').click
  # end

  button(:continue_shopping, value: 'Adopt Another Puppy')

  private

  # def row_for(line_item)
  #   (line_item.to_i - 1) * LINES_PER_PUPPY
  # end
  #
  # def cart_line_item(line_item)
  #   @browser.table(index: 0)[row_for(line_item)]
  # end

  def table_value(lineitem, column)
    row = (lineitem.to_i - 1) * LINES_PER_PUPPY
    cart_element[row][column].text
  end
end