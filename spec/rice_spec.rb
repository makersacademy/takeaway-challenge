require 'rice'

describe Rice do
  describe '#price' do
    it 'returns the price of a rice' do
      rice = Rice.new
      expect(rice.price).to eq(2)
    end 
  end
end
