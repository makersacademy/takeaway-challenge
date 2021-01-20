require 'takeaway_order'

describe TakeawayOrder do 


  context '#add_to_order' do 
    it 'should add dish to order' do
      subject.add_to_order("Cheeseburger", 1)
      expect(subject.basket).to eq [{ dish: "Cheeseburger", unit_price: 0.99, quantity: 1 }]
    end
    it 'should raise error if dish not on menu' do 
      expect { subject.add_to_order("Spag Bog", 1) }.to raise_error "Dish not on menu"
    end
  end

  context '#calculate_total' do 
    it 'return total value of basket items' do
      subject.add_to_order("Cheeseburger", 5)
      subject.add_to_order("9 Chicken Nuggets", 1)
      expect(subject.calculate_total). to eq 8.34
    end
  end

  context '#view_order' do
    it 'returns basket of items w/ prices, next to total cost' do 
      subject.add_to_order("Cheeseburger", 5)
      expect(subject.view_order).to eq [[{ dish: "Cheeseburger", unit_price: 0.99, quantity: 5 }], 4.95]
    end
  end

  context '#place_order' do 
    it 'should send text message' do 
      allow(subject).to receive(:confirmation_message) { true }
      expect(subject.place_order).to eq true
    end
  end
end
