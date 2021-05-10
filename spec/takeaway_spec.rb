require 'takeaway' 

describe Takeaway do
  let(:items) { { martini: 8, mojito: 7, old_fashioned: 9,
        margarita: 7 }
  }    
  let(:order) { { martini: 3, mojito: 2 } }
  let(:wrong_order) { { martini: 3, sausage: 1 } }
  let(:subject) { Takeaway.new(items, sms) }
  let(:sms) {double('Sms', :send => nil) }

  describe '#list_items' do
    it 'returns a hash of items and prices' do
      expect(subject.list_items).to eq(items)
    end
  end
  
  describe '#place_order' do
    it 'can place an order and return a total' do
      expect(subject.place_order(order)).to eq(38)
    end
    # it 'will only accept order items from the menu' do
     # expect{ subject.place_order({"Gin and Tonic" => 1}) }.to #raise_error("Your order is incorrect")
    # end
    it 'will only return the total for items that exist on the menu' do
      expect(subject.place_order(wrong_order)).to eq 24
    end
    it 
  end
    it 'sends a confirmation text message' do
      expect(sms).to receive(:send)
      subject.place_order(order)
  end

end
