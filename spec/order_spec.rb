require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double('Menu') }
  let(:items) { {'Classic Fondue': 2,'Special Fondue': 1} }

  describe '#add' do
    it 'should add the selected dishes with specified quantity to the order' do
      order.add(:'Classic Fondue', 2)
      expect(order.items).to include('Classic Fondue': 2)
    end
  end

end
