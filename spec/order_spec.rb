require 'order.rb'
describe Order do
  context '#intialize' do
    it 'should intialize current order as an empty array' do
      expect(Order.new.current_order).to be_empty
    end
  end

  context '#add_to_order' do
    it 'should add the food into the order' do
      order = Order.new
      expect(order.add_to_order("Chicken")).to eq ["Chicken"]

    end
  end
end
