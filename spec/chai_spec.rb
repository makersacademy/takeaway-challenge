require 'chai'

describe Chai do 
  describe "#price" do
    it 'returns the price of a cup of chai' do
      chai = Chai.new
      expect(chai.price).to eq(2)
    end
  end
end
