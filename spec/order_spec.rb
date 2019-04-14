require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double('Menu') }
  let(:dishes) do
    {
      chicken: 2,
      fish: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fish).and_return(true)
  end

  describe '#add' do
    it 'adds several dishes from the menu' do
      order.add(:chicken, 2)
      order.add(:fish, 1)
      expect(order.dishes).to eq(dishes)
    end

    context 'when adding an item not on the menu' do
      it 'raises an error' do
        allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
        expect { order.add(:beef, 2) }.to raise_error 'Beef is not on the menu!'
      end
    end
  end
end
