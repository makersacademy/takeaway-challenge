require 'bhaji'

describe Bhaji do
  describe '#price' do
    it 'returns the price of a bhaji' do
      bhaji = Bhaji.new
      expect(bhaji.price).to eq(4)
    end 
  end
end
