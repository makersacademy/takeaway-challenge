require 'basket'

describe Basket do
  subject(:basket) { described_class.new }

  describe '#initialize' do
    it 'is created with 0 orders contained in it' do
      expect(basket.orders).to eq []
    end
  end
end
