require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double('Menu') }
  let(:dish) { {'Classic Fondue': 2,'Special Fondue': 1} }
  # let(:price) { {'Classic Fondue': 13.0, 'Special Fondue': 14.5} }

  describe '#add' do

    before do
      allow(menu).to receive(:available?).with(:'Classic Fondue').and_return(true)
      allow(menu).to receive(:available?).with(:'Special Fondue').and_return(true)
      allow(menu).to receive(:price).with(:'Classic Fondue').and_return(13.0)
      allow(menu).to receive(:price).with(:'Special Fondue').and_return(14.5)
    end

    it 'should add the selected dishes with specified quantity to the order' do
      order.add(:'Classic Fondue', 2)
      expect(order.items).to include('Classic Fondue': 2)
    end
    it 'should raise error message if dish requested is not in the menu' do
      allow(menu).to receive(:available?).with(:Chicken).and_return(false)
      expect { order.add(:Chicken, 2) }.to raise_error "That dish is not in the menu"
    end

    it 'calculates the total for the order' do
      new_order
      total = 40.5
      expect(order.total).to eq(total)
    end

    def new_order
        order.add(:'Classic Fondue', 2)
        order.add(:'Special Fondue', 1)
    end
  end

end
