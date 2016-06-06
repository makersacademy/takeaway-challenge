require 'basket'

describe Basket do

  subject(:basket) { described_class.new }

  describe '#initialize' do
    it 'creates empty ordered_items hash' do
      expect(basket.ordered.length).to eq 0
    end

    it 'creates total of zero' do
      expect(basket.total).to eq 0
    end
  end

end
