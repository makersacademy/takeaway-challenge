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

  describe '#summary' do
    before do
      order.instance_variable_set(:@list, { "chicken burger": 1, "chicken wings": 2 })
    end
    it 'shows the basket summary with totalled up prices' do
      expect(order.summary).to eq "chicken burger x1 = 3.49, chicken wings x2 = 9.98"
    end
  end

  describe '#calculate_total' do
    it 'shows the total price of current order' do
      order.add("chicken wings", 2)
      expect(order.calculate_total).to eq "9.98"
      order.add("chicken burger", 3)
      expect(order.calculate_total).to eq "20.45"
    end
  end

  describe '#try_complete' do
    before do
      order.add("chicken wings", 2)
      order.add("chicken burger", 3)
    end

    it 'returns true if amount given at checkout matches total' do
      expect(order.try_complete(20.45)).to eq true
    end

    it 'returns false if amount given at checkout does not match total' do
      expect(order.try_complete(20.46)).to eq false
    end
  end
end
