require 'menu'
require 'order'

RSpec.describe 'features' do
  context 'User Story 1' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
  
    menu = Menu.new
    menu.print
  end

  context 'User Story 2' do
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    order = Order.new
    order.take_order
  end

end
