require 'order'

describe Order do
  subject(:order) { (Order.new) }
  
  before :each do
    order.add_to_order("Pizza")
  end
  
  describe '#add_to_order' do
    
    it 'should add items from the menu to the empty order hash' do
      expect(order.basket).to include(:Pizza => 5)
    end
    
    it 'should return an error if the item isn\'t on the menu' do
      item = "Pasta"
      expect{ order.add_to_order(item) }.to raise_error  "#{item} is not available - please select a different item."
    end
  end
  
  describe '#place_order' do
  
    it 'should return an empty hash confirming that the order was successful' do
      expect(order.place_order(5)).to eq order.clear_order            # Unsure on this test.
    end
    
    it 'should return an error if the price does not match the order total' do
      expect{ order.place_order(4) }.to raise_error "Please check the sum of your basket and try again."
    end
  end
  
  describe '#clear_order' do
    
    it 'should clear the hash of all existing items' do
      order.clear_order
      expect(order.basket).to be_empty
    end
  end
end