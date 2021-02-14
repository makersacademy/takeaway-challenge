require 'basket'

describe Basket do

  describe '#add' do
    it'adds items to the basket' do
      basket = Basket.new
      basket.add('thing')
      expect(basket.contents).to eq ['thing']
    end
  end
end
