require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu") }
  let(:dishes) do {
   margherita: 3,
   capricciosa: 4,
   marinara: 2
  }

  end
  before do
    allow(menu).to receive(:dish_available?).with(:margherita).and_return(true)
    allow(menu).to receive(:dish_available?).with(:capricciosa).and_return(true)
    allow(menu).to receive(:dish_available?).with(:marinara).and_return(true)

    allow(menu).to receive(:price).with(:margherita).and_return(4.00)
    allow(menu).to receive(:price).with(:capricciosa).and_return(4.50)
    allow(menu).to receive(:price).with(:marinara).and_return(3.50)
  end

  context 'when order is initialised' do
    it 'returns an empty hash' do
      expect(order.basket).to be_empty
    end

    it 'returns a menu' do
      expect(order.menu).not_to eq nil
    end
  end

  context 'selection of dishes' do
    describe '#add' do
      it 'adds items and their quantities to the dishes hash' do
        order.add(:margherita, 3)
        order.add(:capricciosa, 4)
        order.add(:marinara, 2)
        expect(order.basket).to eq(dishes)
      end
    end

    it 'raises an error if dish is not on the list' do
      error_message = 'Hawaii is not on our menu, please select another item.'
      allow(menu).to receive(:dish_available?).with(:hawaii).and_return(false)
      expect { order.add(:hawaii, 1) }.to raise_error error_message
    end
  end

  context 'calculating the total of the order' do
    describe '#total' do
      it 'calculates the total of the order' do
        order.add(:margherita, 3)
        order.add(:capricciosa, 4)
        order.add(:marinara, 2)
        expect(order.total).to eq(37)
      end
    end

  end


end
