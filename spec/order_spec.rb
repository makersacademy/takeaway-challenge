require 'order'

describe Order do
  context 'Show name and price' do
    it 'item initialized with a name' do
      order = Order.new('name', 0)
      expect(order.name).to eq 'name'
    end 

    it 'item initialized with a price' do 
      order = Order.new('name', 0)
      expect(order.price).to eq 0
    end 
  end 
end 