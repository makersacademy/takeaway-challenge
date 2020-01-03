require 'order'
require 'order_line'

describe 'Order' do
  describe '#initialize' do
    it 'can create a new instantiated DishList' do
      subject = Order.new(OrderLine)
      expect(subject).to be_an_instance_of Order
    end
  end

  # describe '#add_order_line' do
  #   it 'Orders a dish: updates an order with a new order_line containing quantity, order name and price per unit' do
  #     subject = Order.new(OrderLine)
  #     quantity = 3
  #     selection = 2
  #     expect(subject.add_order_line(quantity, selection).to eq subject.last)
  #   end
  #   it 'fails if the selction does not exist' do
  #     subject = Order.new(OrderLine)
  #     quantity = 3
  #     selection = 72
  #     expect(subject.add_order_line(quantity, selection).to raise_error "Selection not on menu")
  #   end
  # end
end
