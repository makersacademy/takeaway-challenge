require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe '#choose' do
    it 'responds to method' do
      expect(order).to respond_to(:choose)
    end

    it 'stores items in current order' do
      order.choose("pizza", 1)
      expect(order.current_order).to eq [{ :pizza => 1 }]
    end
  end

  describe '#show_menu' do
    it 'returns an Array' do
      expect(order.show_menu.class).to eq Array
    end
  end
end
