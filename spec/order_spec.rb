require 'order'

describe Order do
  
  subject(:order) { described_class.new }
  let(:pizza)     { {"Pizza"=>10.0}     }
  let(:pasta)     { {"Pasta"=>8.0}     }
  
  before do
    3.times { order.add(pizza)}
    2.times { order.add(pasta)}
  end
  
  describe '#add' do
  
    it 'Adds items to the order status' do
    
      expect(order.status).to include pizza
    
    end
  end
  
  describe '#check_order' do
   
   it 'returns the total of the current order' do
     
     expect(order.check_order).to eq "Total = £46.0"
   end
  
    
    it 'returns the list of items currently ordered' do
      
      expect{ order.check_order}.to output("Pizza x 3 = £30.0\nPasta x 2 = £16.0\n").to_stdout
      
    end
  end
  
  describe '#clear_order' do
    
    it 'clears the current order' do
      
      order.clear_order
      expect(order.status).to eq []
      
    end
  end
  
   
end
