require 'order'

describe Order do
  subject(:new_order) { (Order.new) }     # 'new_order' used to avoid confusion with the instance variable 'order'.
  
  describe '#initialize' do
    
    it 'should contain a hash used to store orders to be empty by default.' do
      expect(new_order.order).to be_empty
    end
  end
  
  describe '#add_to_order' do
    
    it 'should add items from the menu to the empty order hash' do
      new_order.add_to_order("Pizza")
      expect(new_order.order).to include(:Pizza => 5)
    end
    
    it 'should return an error if the item isn\'t on the menu' do
      item = "Pasta"
      expect{ new_order.add_to_order(item) }.to raise_error  "#{item} is not available - please select a different item."
    end
  end
  
  describe '#place_order' do
  
    it 'should return an empty hash confirming that the order was successful' do
      new_order.add_to_order("Burger")
      expect(new_order.place_order(3)).to eq new_order.clear_order            # Unsure on this test.
    end
    
    it 'should return an error if the price does not match the order total' do
      new_order.add_to_order("Burger")
      expect{ new_order.place_order(4) }.to raise_error "You have entered an incorrect amount."
    end
  end
  
  describe '#clear_order' do
    
    it 'should clear the hash of all existing items' do
      new_order.add_to_order("Fries")
      new_order.clear_order
      expect(new_order.order).to be_empty                         # This test needs refactoring.
    end
  end
end