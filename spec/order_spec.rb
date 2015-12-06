require 'order'

describe Order do
  let(:menu) { double :menu, has?: true }
  let(:order) { described_class.new(menu) }

  describe '#menu' do
    it 'has to show dishes available in menu' do
      expect(order.menu).to eq menu
    end
  end

  describe '#show_basket' do
    it 'says the basket is empty at the beginning' do
      msg = 'Basket is empty'
      expect(order.show_basket).to eq msg
    end
  end

  describe '#add' do
    it 'adds a quantity of dish to the basket' do
      order.add('dish', 3)
      expect(order.basket).to include 'dish' => 3
    end

    it 'raise an error if the dish is not in the menu' do
      allow(menu).to receive(:has?).and_return false
      msg = 'Dish not available'
      expect { order.add('dish_not_available', 1) }.to raise_error msg
    end
  end

  context 'when basket is no more empty' do
    before do
      order.add('dish1', 2)
      order.add('dish2', 1)
    end
    describe '#add' do
      it 'adds the dish with no overwriting previous amount' do
        order.add('dish1', 1)
        expect(order.basket).to include 'dish1' => 3
      end
    end
    describe '#total' do
      it 'returns the total of the order' do
        allow(menu).to receive(:dishes).and_return('dish1' => 10, 'dish2' => 20)
        expect(order.total).to eq 40
      end
    end
  end
end
