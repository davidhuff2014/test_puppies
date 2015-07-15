require_relative 'error_panel'
require_relative 'side_menu_panel'

class DetailsPage

  include PageObject
  include ErrorPanel
  include SideMenuPanel

  button(:add_to_cart, value: 'Adopt Me!')
end