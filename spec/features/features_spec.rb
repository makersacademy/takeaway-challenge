require 'order'
require 'menu'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe Order do
  it 'starts a new order' do
   order = Order.new
  end

  describe '#show_menu' do
    it 'shows the list of available dishes' do
     order = Order.new
     #order.show_menu
    end
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  
  describe '#choose' do
   it 'records the quantity as well' do
    order = Order.new
    order.choose("Margherita", 2)
  end
 end
end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order


