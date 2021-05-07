require 'korma'

describe Korma do
  describe '#price' do 
    it 'returns the price of a korma' do
      korma = Korma.new
      expect(korma.price).to eq(8)
    end
  end
end
