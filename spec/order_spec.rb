require 'order'

describe Order do
  
  subject(:order) { described_class.new }
  
  describe '#add' do
  
    it 'Adds items to the order status' do
    
      order.add({"Pizza"=>10.0})
      expect(order.status).to include({"Pizza"=>10.0})    
    
    end
  end
  
  describe '#total' do
   
   it 'returns the total of the current order' do
     
     3.times { order.add({"Pizza"=>10.0}) }
     expect(order.check_total).to eq 30
   end
  end
  
end