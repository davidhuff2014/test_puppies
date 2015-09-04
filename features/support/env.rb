require 'fig_newton'
# FigNewton.load('local.yml')
# FigNewton.load('heroku.yml')
# these are now in the cucumber.yml



require 'rspec'
require 'page-object'
require 'faker'
require 'data_magic'
require 'require_all'
require 'factory_girl'
require 'nokogiri'
require 'builder'
require 'soap-object'
require 'pretty_face'

require_rel 'pages'

PageObject.default_page_wait = 20
PageObject.default_element_wait = 5

PageObject::PageFactory.routes = {
                            :default => [[HomePage, :select_puppy],
                            [DetailsPage, :add_to_cart],
                            [ShoppingCartPage, :proceed_to_checkout],
                            [CheckoutPage, :checkout]],
                        }

World(PageObject::PageFactory)

World(FactoryGirl::Syntax::Methods)

World(SoapObject::Factory)
