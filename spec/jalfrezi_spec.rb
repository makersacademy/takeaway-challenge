require 'jalfrezi'

describe Jalfrezi do 
  describe '#price' do
    it 'returns the price of a jalfrezi' do
      jalfrezi = Jalfrezi.new
      expect(jalfrezi.price).to eq(10)
    end
  end
end
