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
     order.show_menu
    end
  end
  
  describe '#choose' do
    it 'records the choice' do
    order = Order.new
    order.choose("Margherita")
  end
 end
end
