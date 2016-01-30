require 'takeaway'

describe Takeaway do
  
  subject(:takeaway)    { described_class.new }
  
  describe 'Allows user to order' do
    
    
    it 'gets the answer for the cuisine type' do
      
      allow(takeaway).to receive(:get_choice) {"1"}
      expect(takeaway.get_choice).to eq "1"
    end
  end
  
  describe "#order" do
    
    it 'stores an item into the order' do
      
      takeaway.order(pizza)
      expect(takeaway.order.trolley).to include?({pizza: 10.0})
      
    end
  end

end