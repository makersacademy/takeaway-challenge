require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:cafe) { double :cafe, :order }

  describe '#add_to_order' do
    it 'stores the item in an array' do
      order.add_to_order("CHIA_PUDDING", 1)
      expect(order.basket).to include "CHIA_PUDDING"
    end

    it 'stores multiple items in an array' do
      order.add_to_order("CHIA_PUDDING", 1)
      order.add_to_order("BANANA_BREAD", 1)
      expect(order.basket).to include "CHIA_PUDDING", "BANANA_BREAD"
    end

    it 'accepts multiples of the same item' do
      order.add_to_order("BANANA_BREAD", 2)
      expect(order.basket).to include "BANANA_BREAD", "BANANA_BREAD"
    end
  end

  describe 'order summary' do
    it 'summarises order so far' do
      order.add_to_order("CHIA_PUDDING", 1)
      order.add_to_order("BANANA_BREAD", 1)
      expect(order.summary).to eq "Your order so far contains: CHIA_PUDDING, BANANA_BREAD, all coming to a total of £11.25."
    end
  end

  describe 'order total' do
    it 'stores the price' do
      order.add_to_order("CHIA_PUDDING", 1)
      expect(order.total).to eq 5.75
    end

    it 'adds the price' do
      order.add_to_order("CHIA_PUDDING", 1)
      order.add_to_order("BANANA_BREAD", 1)
      expect(order.total).to eq 11.25
    end

    it 'adds the price of multiples' do
      order.add_to_order("BANANA_BREAD", 2)
      expect(order.total).to eq 11
    end

    it 'matches customer expectation' do
      order.add_to_order("BANANA_BREAD", 3)
      expect(order.check(16.50)).to be_truthy
    end

    it 'does not match customer expectation' do
      order.add_to_order("BANANA_BREAD", 3)
      expect(order.check(6.50)).to be_falsey
    end
  end

end
