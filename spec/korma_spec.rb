require 'korma'

describe Korma do
    it 'returns the price of a korma' do
      korma = Korma.new
      expect(korma.price).to eq(8)
    end
    it 'returns the name Korma' do
      korma = Korma.new
      expect(korma.name).to eq("Korma")
    end
    
end
