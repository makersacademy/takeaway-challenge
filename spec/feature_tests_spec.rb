require 'takeaway'

describe 'Feature Tests' do
  let(:takeaway) { Takeaway.new('Beef & Beer') }

  describe 'List of dishes with prices' do
    it 'prints the list of dishes with prices when promted' do
      takeaway.restaurant.menu.add_item('Burger', 3)
      takeaway.restaurant.menu.add_item('Beer', 3)
      expect{takeaway.interface.process('1')}.to output("1. Burger: £3\n2. Beer: £3\n").to_stdout
    end
  end

  describe 'Cart' do
    it 'stores a selection of items' do
      item1 = takeaway.restaurant.menu.add_item('Burger', 3)
      takeaway.cart.select_item(takeaway.restaurant.menu.items[0])
      expect([takeaway.cart.list]).to include(item1)
    end
  end
end
