require "price.rb"

describe Price do
  describe '.set_price' do
    it 'sets the price of an object when applicable' do
      price = Price.set_price(8.00)
      expect(price).to eq(8.00)
    end
  end
end