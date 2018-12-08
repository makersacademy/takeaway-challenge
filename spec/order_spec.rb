require 'order'

RSpec.describe Order do 
  let(:order){ Order.new }

  describe '#initalize' do
    it 'creates an empty order list'do
      expect(order.order_list).to be_empty
    end
  end
  describe '#take_order' do 
    it 'takes a dish' do 
      expect(order).to respond_to(:take_order).with(1)
    end 
    it 'adds the item to the order_list' do
      item = "pizza"
      expect{ order.take_order(item) }.to change(order.order_list, :count).by(1)
      expect(order.take_order(item)).to include(item)
    end 
  end 
end

