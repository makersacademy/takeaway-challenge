require "order"

describe Order do
  subject(:empty_order) { described_class.new }
  let(:fake_order) { { pizza: 10 } }
  subject(:pizza_order) do
    empty_order.save_order(fake_order)
    empty_order
  end

  it 'initializes with an empty list' do
    expect(empty_order.items).to eq []
  end

  describe '#save_order' do
    it 'saves order in items' do
      expect(pizza_order.items).to include fake_order
    end
  end

  describe '#finish' do
    it 'totals the order' do
      expect(pizza_order.finish).to eq [fake_order]
    end
  end
end
