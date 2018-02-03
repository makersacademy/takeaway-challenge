require "order"

describe Order do
  subject(:empty_order) { described_class.new }
  let(:fake_order) { { pizza: 10 } }

  it 'initializes with an empty list' do
    expect(empty_order.items).to eq []
  end

  describe '#save_order' do
    it 'saves order in items' do
      empty_order.save_order(fake_order)
      expect(empty_order.items).to include fake_order
    end
  end
end
