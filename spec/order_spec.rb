require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'has an empty order upon instantiation' do
    expect(order.list).to eq({})
  end

  describe '#add' do
    it 'adds an item to the basket' do
      order.add(:"chicken wings")
      expect(order.list).to eq({ "chicken wings": 1 })
    end

    it 'adds multiple items to the list' do
      order.add(:"chicken wings", 3)
      expect(order.list).to eq({ "chicken wings": 3 })
    end
  end
end
