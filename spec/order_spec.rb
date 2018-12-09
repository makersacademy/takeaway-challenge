require 'order'

describe Order do

  let(:order) { Order.new }

  describe '#add' do
    it 'responds to #add' do
      expect(order).to respond_to(:add)
    end

    it 'adds menu items to total_order' do
      order.add()
      expect(order.total_order).not_to be_empty
    end
  end
end
