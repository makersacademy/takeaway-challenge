require 'order'

describe Order do

  let(:order) { described_class.new }

  describe '#take_order' do
    it 'should take a  dish order with quantity' do
      order.take_order(:pie, 4)
      expect(order.current_order).to eq(pie: 4)
    end

    it 'should not duplicate orders' do
      order.take_order(:pie, 4)
      order.take_order(:pie, 3)
      expect(order.current_order).to eq(pie: 7)
    end
  end
end
