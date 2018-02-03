require "till"

describe Till do
  subject(:till) { described_class.new }
  let(:fake_order) { [{ pizza: 10, red_wine: 4, bolognese: 9 }] }

  it 'initializes with empty total' do
    expect(till.total).to eq 0
  end

  describe '#sum' do
    it 'sums the order and adds it to total' do
      till.sum(fake_order)
      expect(till.total).to eq 23
    end
  end
end
