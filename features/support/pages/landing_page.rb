require_relative 'side_menu_panel'

class LandingPage

  include PageObject
  include SideMenuPanel

  # page_url 'http://puppies.herokuapp.com/admin'
  # page_url 'http://localhost:3000/admin'
  page_url "#{ FigNewton.base_url }/admin"
end