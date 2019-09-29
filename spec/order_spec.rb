require 'order'

describe Order do
  let(:dish) { double("Dish", name: 'shwarma', cost: 9) }
  let(:dish2) { double("Dish", name: 'pizza', cost: 5) }
  let(:dish3) { double("Dish", name: 'burger', cost: 7) }
  subject(:order) { described_class.new }

  describe '#dishes' do
    it 'contains a list of dishes' do
      expect(order.dishes.class).to eq Array
    end
  end

  describe '#add' do
    it 'adds a dish to dishes array' do
      expect(order.add(dish)).to eq [dish]
    end
  end

  describe '#remove' do
    context 'if a dish has been added' do
      before do
        order.add(dish)
      end
      it 'removes a dish from dishes array' do
        expect(order.remove(dish)).to eq []
      end
    end

    context 'if no dish has been added' do
      it 'raises an error message' do
        message = "Woah there, you haven't ordered this yet"
        expect{ order.remove(dish2) }.to raise_error message
      end
    end
  end
end
