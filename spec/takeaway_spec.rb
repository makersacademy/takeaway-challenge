require 'takeaway'

describe Takeaway do
  
  subject(:takeaway)    { described_class.new restaurant, order, messager }
     let(:messager)     { double :messager    }
     let(:restaurant)   { double :restaurant, menu: { "Pizza"=> 10.00, "Pasta"=> 8.00, "Milanese"=> 14.00} }
     let(:order)        { double :order       }
     let(:item)         { {"Pizza"=> 10.0}    }
     let(:item2)        { {"Pasta"=> 8.0 }    }
  
  describe 'Allows user to order' do
    
    it { is_expected.to respond_to(:clear_order)}
    it { is_expected.to respond_to(:check_order)}
    it { is_expected.to respond_to(:choice)}
    
    
    it 'gets the answer for the cuisine type' do
      
      allow(takeaway).to receive(:get_choice) {"1"}
      expect(takeaway.get_choice).to eq "1"
    end
  end
  
  
  describe "#order" do
    
    it 'stores an item into the order' do
      allow(order).to receive(:add).with(item)
      allow(order).to receive(:status) {item}
      restaurant.stub_chain(:menu, :key?) {true}
      takeaway.order("pizza", 2)
      expect(takeaway.order_log.status).to include(item)
      
    end
    
    it 'stores items in hashes' do
      allow(order).to receive(:add).with(item2)
      order.stub_chain(:status, :last) {item2}
      takeaway.order("pasta")
      expect(takeaway.order_log.status.last).to be_an Hash
    end
    
    it 'returns a confirmation message with item and quantity' do
      allow(order).to receive(:add).with(item)
      expect(takeaway.order("pizza", 2)).to eq "2 x Pizza added to your order."
      
    end
    
  end
  
  describe '#check_out' do
    
    it 'Does not finalises the order if total inputted is not correct' do
      allow(order).to receive(:add).with(item2)
      allow(order).to receive(:total) {false}
      takeaway.order("pasta")
      allow(messager).to receive(:send_sms)
      expect(takeaway.check_out 34).to eq "The total is not correct or no order has been made!"
    end
    
  end
  

end
