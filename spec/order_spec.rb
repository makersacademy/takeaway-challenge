require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:selection) { { "tacos" => 2, "burrito" => 2 } } 

  describe '#add order' do
    it '#adds dish and price' do
      order.add_order("tacos", 2)
      order.add_order("burrito", 2)
      expect(order.selection).to eq(selection)
    end
  end

  describe '#total' do
    it 'returns the total price' do
      order.add_order("tacos", 2)
      order.add_order("burrito", 2)
      expect(order.total).to eq "Total cost: 20"
    end
  end
end
