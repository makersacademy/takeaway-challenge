require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double('Menu') }
  let(:dish) { {'Classic Fondue': 2,'Special Fondue': 1} }
  # let(:price) { {'Classic Fondue': 13.0, 'Special Fondue': 14.5} }

  describe '#add' do
    it 'should add the selected dishes with specified quantity to the order' do
      order.add(:'Classic Fondue', 2)
      expect(order.items).to include('Classic Fondue': 2)
    end
    # it 'should raise error message if dish requested is not in the menu' do
    #   order.add('Chicken', 1)
    #   expect(order.items).to raise_error 'That dish is not in the menu'
    # end
  end

  describe '#total' do
    it 'calculates the total for the order' do
      allow(menu).to receive(:price).with(:'Classic Fondue').and_return(13.0)
      allow(menu).to receive(:price).with(:'Special Fondue').and_return(14.5)

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
