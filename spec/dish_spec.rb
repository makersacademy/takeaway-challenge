require 'dish'

describe Dish do
  let(:dish) { described_class.new('pizza', 6, 20) }
  context 'when created' do
    it 'has a name' do
      expect(dish.name).to eq 'pizza'
    end
    it 'has a price' do
      expect(dish.price).to eq 6
    end
    it 'is available' do
      expect(dish).to be_available
    end
    it 'has an initial quantity' do
      expect(dish.quantity).to eq 20
    end
  end
end
