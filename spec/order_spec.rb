require 'order'

describe Order do

  let(:order) { Order.new }
  before do
    allow($stdout).to receive(:write)
  end
  describe '#add' do
    it 'responds to #add' do
      expect(order).to respond_to(:add)
    end

    it 'adds menu items to total_order' do
      order.add(1)
      expect(order.total_order).not_to be_empty
    end
  end
  describe '#order_complete' do
    context 'input is y' do
      it 'returns input' do
        allow(order.order_complete).to receive(:gets).and_return("y")
        expect(order.ordercomplete).to eq(:input)
      end
    end
  end
end
