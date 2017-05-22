require 'takeaway'

describe 'Feature Tests' do
  let(:takeaway) { Takeaway.new('Beef & Beer') }

  describe 'List of dishes with prices' do
    it 'prints the list of dishes with prices when promted' do
      takeaway.restaurant.menu.add_item('Burger', 3)
      takeaway.restaurant.menu.add_item('Beer', 3)
      expect{ takeaway.interface.process('1') }.to output("1. Burger: £3\n2. Beer: £3\n").to_stdout
    end
  end

  describe 'Cart' do
    it 'stores a selection of items' do
      item1 = takeaway.restaurant.menu.add_item('Burger', 3)
      takeaway.cart.select_item(takeaway.restaurant.menu.items[0])
      expect([takeaway.cart.list]).to include(item1)
    end
  end

  describe 'Order' do
    it 'calculates total and outputs the list of items ordered with prices' do
      item1 = takeaway.restaurant.menu.add_item('Burger', 3)[0]
      item2 = takeaway.restaurant.menu.add_item('Beer', 2)[1]
      takeaway.cart.select_item(takeaway.restaurant.menu.items[0])
      takeaway.cart.select_item(takeaway.restaurant.menu.items[1])
      takeaway.checkout
      expect(takeaway.order.calculate_total).to eq(item1.price + item2.price)
    end
  end

  # describe 'Message Notification' do
  #   it 'is sent when order is placed' do
  #     item1 = takeaway.restaurant.menu.add_item('Burger', 3)[0]
  #     item2 = takeaway.restaurant.menu.add_item('Beer', 2)[1]
  #     takeaway.cart.select_item(takeaway.restaurant.menu.items[0])
  #     takeaway.cart.select_item(takeaway.restaurant.menu.items[1])
  #     takeaway.checkout
  #     expect{ takeaway.confirm }.to output("Your order has been placed\n").to_stdout
  #   end
  # end
end
