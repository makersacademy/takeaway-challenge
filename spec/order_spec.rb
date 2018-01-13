require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:cafe) { double :cafe, :order }

  describe 'ordering' do
    it 'stores the item in an array' do
      order.add_to_order("CHIA_PUDDING")
      expect(order.full_order).to include :CHIA_PUDDING
    end

    it 'stores multiple items in an array' do
      order.add_to_order("CHIA_PUDDING")
      order.add_to_order("BANANA_BREAD")
      expect(order.full_order).to include :BANANA_BREAD
    end

    it 'stores multiple items in an array' do
      order.add_to_order("CHIA_PUDDING")
      order.add_to_order("BANANA_BREAD")
      expect(order.full_order).to include :CHIA_PUDDING
    end

    it 'converts input to a symbol' do
      order.add_to_order("CHIA_PUDDING")
      expect(order.full_order).to include :CHIA_PUDDING
    end

  end

end

# it 'adds one item\'s key value pair to a hash' do
#   item = :CHIA_PUDDING
#   order.add_to_order(item)
#   expect(order.full_order).to include :CHIA_PUDDING
# end
