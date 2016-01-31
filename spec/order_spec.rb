require 'order'

describe Order do
  subject(:order)     { described_class.new("2 Chicken Ruby", "1 Kingfisher") }
  let(:order_hash)    { { chicken_ruby: 2, kingfisher: 1 } }

  describe '#total' do
    it { is_expected.to respond_to(:total) }
    let(:total) do
      order_hash.reduce(0) do |sum, (k, v)|
        sum + v * described_class::MENU[k]
      end
    end

    it 'returns the total cost for the order' do
      expect(order.total).to eq total
    end
  end

  describe '#summary' do
    it { is_expected.to respond_to(:summary) }

    it 'returns the order summary' do
      expect(order.summary).to eq order_hash
    end
  end

  # describe '#check_total' do
  #   it { is_expected.to respond_to(:verify) }
  #
  #
  # end
end
