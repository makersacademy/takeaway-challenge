require 'order'

RSpec.describe Order do 
  let(:order){ Order.new }

  describe '#initalize' do
    it 'creates an empty order list'do
      expect(order.items_ordered).to be_empty
    end
  end
  describe '#take_order' do 
    it 'takes a dish' do 
      expect(order).to respond_to(:take_order).with(1)
    end 
    it 'adds the item to the order_list' do
      item = "pizza"
      expect{ order.take_order(item) }.to change(order.items_ordered, :count).by(1)
      expect(order.take_order(item)).to include(item)
    end
  end 
  describe '#calculate total' do
    it 'returns total of order' do
      order.take_order("pizza")
      order.take_order("pasta")
      expect(order.calculate_total).to eq("The total of the items you selected is 19.95")
    end
  end
end

