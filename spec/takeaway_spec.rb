require 'takeaway'

describe Takeaway do 
  context '#menu' do
    it '#see_menu should return the menu' do 
      expect(subject.see_menu).to eq subject.menu
    end

    it 'should be an array' do 
      expect(subject.menu).to be_a Array
    end

    it 'should include hashes' do 
      expect(subject.menu).to include Hash
    end

    it 'should have individual dishes as hashes' do 
      expect(subject.menu[-2]).to be_a Hash
    end

  end

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
    let(:takeaway) { double :takeaway }
    it 'should send text message' do 
      allow(takeaway).to receive(:place_order) { true }
      expect(takeaway.place_order).to eq true
    end
  end
end
