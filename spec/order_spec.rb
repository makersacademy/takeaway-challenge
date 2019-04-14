require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:selection) { { "burger" => 2, "chips" => 2 } } 

  describe '#add order' do
    it '#adds dish and price' do
      order.add_order("burger", 2)
      order.add_order("chips", 2)
      expect(order.selection).to eq(selection)
    end
  end

  describe '#total' do
    it 'returns the total price' do
      order.add_order("burger", 2)
      order.add_order("chips", 2)
      expect(order.total).to eq "Total cost: 22"
    end
  end
end
