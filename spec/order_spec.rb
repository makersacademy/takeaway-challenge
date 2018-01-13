require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:cafe) { double :cafe, :order }

  describe '#add_to_order' do
    it 'stores the item in an array' do
      order.add_to_order("CHIA_PUDDING")
      expect(order.basket).to include({ :CHIA_PUDDING => 5.75 })
    end

    it 'stores multiple items in an array' do
      order.add_to_order("CHIA_PUDDING")
      order.add_to_order("BANANA_BREAD")
      expect(order.basket).to include({ :CHIA_PUDDING => 5.75 }, { :BANANA_BREAD => 5.50 })
    end

    it 'accepts multiples of the same item' do
      order.add_to_order("BANANA_BREAD", 2)
      expect(order.basket).to include({ :BANANA_BREAD => 5.50 }, { :BANANA_BREAD => 5.50 })
    end
  end

  describe 'order summary' do
    it 'summarises order so far' do
      order.add_to_order("CHIA_PUDDING")
      order.add_to_order("BANANA_BREAD")
      expect(order.summary).to eq "Your order so far contains: CHIA_PUDDING, BANANA_BREAD, all coming to a total of £11.25."
    end
  end

  describe 'order total' do
    it 'stores the price' do
      order.add_to_order("CHIA_PUDDING")
      expect(order.total).to eq 5.75
    end

    it 'adds the price' do
      order.add_to_order("CHIA_PUDDING")
      order.add_to_order("BANANA_BREAD")
      expect(order.total).to eq 11.25
    end
  end

end
