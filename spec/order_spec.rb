require 'order'
describe Order do
  let(:menu) { double :menu, price: 20 }
  subject(:order) { Order.new(menu) }
  before do
    allow(menu).to receive(:menu).and_return({ "Carbonara" => 20 })  
  end

  describe '#initialize' do
    it 'initializes with an empty basket' do 
      expect(order.basket).to eq({})
    end
  end

  describe '#add_to_basket' do
    it 'defaults order quantity to 1' do 
      order.add("Carbonara")
      expect(order.basket).to eq({ "Carbonara" => 1 })
    end

    it 'adds order input to basket' do
      order.add("Carbonara", 2)
      expect(order.basket).to eq({ "Carbonara" => 2 })
    end

    it 'raises error if input item is not available at the restaurant' do
      expect { order.add("Chicken caesar salad") }.to raise_error "Item not available at this restaurant"
    end
  end

  describe '#remove_from_basket' do
    it 'removes food from basket' do
      order.add("Carbonara")
      order.remove("Carbonara")
      expect(order.basket).to be_empty
    end

    it 'raises error if input item is not in basket' do
      expect { order.remove("chicken") }.to raise_error "Item not in basket"
    end  
  end

  describe '#total' do
    it 'calculates the total price' do
      order.add("Carbonara")
      order.add("Carbonara")
      expect(order.total).to eq(40)
    end
  end
end
