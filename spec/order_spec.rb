require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'has an empty order upon instantiation' do
    expect(order.list).to eq({})
  end

  describe '#add' do
    it 'adds an item to the basket' do
      order.add(:"quarter chicken")
      expect(order.list).to eq({"quarter chicken": 1})
    end

    it 'adds multiple items to the list' do
      order.add(:"half chicken", 3)
      expect(order.list).to eq({"half chicken": 3})
    end
  end
end
