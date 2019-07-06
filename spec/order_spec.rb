require 'order'

describe Order do
  subject(:order) { described_class.new(restaurant: "fishnchips.csv") }
  describe '#add' do
    it 'adds dishes and quantities to the order hash' do
      expect(order.add('Fish', 3)).to eq({ 'Fish' => 3 })
    end
  end
end
