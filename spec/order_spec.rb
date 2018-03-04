require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu") }
  let(:dishes) do {
   margherita: 3
  }

  end
  before do
    allow(menu).to receive(:dish_available?).with(:margherita).and_return(true)

    allow(menu).to receive(:price).with(:margherita).and_return(4.00)
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
        expect(order.basket).to eq(dishes)
      end
    end

    it 'raises an error if dish is not on the list' do
      error_message = 'Hawaii is not on our menu, please select another item.'
      allow(menu).to receive(:dish_available?).with(:hawaii).and_return(false)
      expect { order.add(:hawaii, 1) }.to raise_error error_message
    end
  end


end
