require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { Menu.new }

  context 'by default' do
    it 'has an empty array' do
      expect(order.basket).to be_empty
    end
  end

  describe '#select_dish' do
    it 'takes a dish number and quantity as arguments' do
      expect(order).to respond_to(:select_dish).with(2).arguments
    end

    it 'stores dish and total in basket' do
      order.select_dish(1, 2)
      expect(order.basket).to include({ :dish => "Egg fried rice", :total => 6 })
    end
  end

  describe '#check_total' do
    it 'sums totals in basket' do
      order.select_dish(1, 2)
      order.select_dish(1, 2)
      expect(order.check_total).to eq 12
    end
  end

  describe '#place_order' do
    it 'raises error if passed incorrect amount' do
      order.select_dish(1, 2)
      expect { order.place_order(11) }.to raise_error "Amount not correct"
    end
  end
end
