require 'takeaway'
require 'menu'
require 'order'

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

describe Takeaway do

  subject(:takeaway) { Takeaway.new }
  subject(:menu) { Menu.new }
  subject(:order) { Order.new }

  context '#show_menu' do
    it 'displays dishes and prices' do
      expect(takeaway.show_menu).to eq(menu.display_menu)
    end
  end
end



  # * Place the order by giving the list of dishes,
  # their quantities and a number that should be the
  # exact total. If the sum is not correct the method
  # should raise an error, otherwise the customer is
  # sent a text saying that the order was placed
  # successfully and that it will be delivered 1
  # hour from now, e.g. "Thank you! Your order was
  # placed and will be delivered before 18:52".
