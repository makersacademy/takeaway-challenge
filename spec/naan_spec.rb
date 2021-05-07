require 'naan'

describe Naan do 
  describe '#price' do
    it 'returns the price of a naan' do
      naan = Naan.new
      expect(naan.price).to eq(4)
    end
  end
end
