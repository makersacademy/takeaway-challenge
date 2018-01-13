require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:cafe) { double :cafe, :order }

  describe '#add_to_order' do
    it 'stores the item in an array' do
      order.add_to_order("CHIA_PUDDING")
      expect(order.basket).to include ({:CHIA_PUDDING=>5.75})
    end

    it 'stores multiple items in an array' do
      order.add_to_order("CHIA_PUDDING")
      order.add_to_order("BANANA_BREAD")
      expect(order.basket).to include ({:BANANA_BREAD=>5.50})
    end

    it 'stores multiple items in an array' do
      order.add_to_order("CHIA_PUDDING")
      order.add_to_order("BANANA_BREAD")
      expect(order.basket).to include ({:CHIA_PUDDING=>5.75})
    end

    it 'converts input to a symbol' do
      order.add_to_order("CHIA_PUDDING")
      expect(order.basket).to include ({:CHIA_PUDDING=>5.75})
    end
  end

  describe 'looking up hash' do
    it 'finds the key value pair' do
      order.add_to_order("CHIA_PUDDING")
      expect(order.basket).to include ({CHIA_PUDDING: 5.75})
    end
  end



end

# it 'adds one item\'s key value pair to a hash' do
#   item = :CHIA_PUDDING
#   order.add_to_order(item)
#   expect(order.full_order).to include :CHIA_PUDDING
# end
