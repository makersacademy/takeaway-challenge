require_relative '../lib/order.rb'
require_relative '../lib/menu.rb'

describe Order do

  let(:cheeseburger) {double(name: 'Cheeseburger', price: 2.99)}
  let(:large_fries) {double(name: 'Large fries', price: 1.99)}

  describe '#create_order' do
    it 'should start with an empty order' do
      expect(subject.new_order).to be_empty
    end

    it 'should create a new order' do
      expect(subject.new_order).to eq([])
    end

    it 'allows a user to select desired number of dishes from menu' do
      subject.add_dish(cheeseburger, 2)
      subject.add_dish(large_fries, 3)
      expect(subject.new_order).to include({cheeseburger => 2}, {large_fries => 3})
    end
  end

  describe '#order_total' do
    it 'should calculate the total cost of an order' do
      subject.add_dish(cheeseburger, 2)
      subject.add_dish(large_fries, 3)
      expect(subject.order_total).to eq 11.95
    end
  end

  describe '#place_order' do
    it 'sends confirmation to a user that the order has been placed' do
      expect(subject.place_order).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end
  end
end
   