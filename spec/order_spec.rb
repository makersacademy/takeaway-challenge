require "order"

describe Order do
  let(:fake_order) { { pizza: 10 } }
  subject(:empty_order) { described_class.new }
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

    it 
  end
end
