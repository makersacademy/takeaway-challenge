require 'order'

describe Order do
  let(:order) { Order.new }

  context 'when no items have been added to order' do
    describe '#check_order' do
      it 'returns nil' do
        expect(order.check_order).to be_nil
      end
    end
  end
end
