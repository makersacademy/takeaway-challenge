require 'basket'

describe Basket do
  
  describe 'calculate the price of an order' do
    it 'recieves a single line order and totals the price' do
      order = [{ name: "Pizza", price: 10 }]
      expect(subject.price(order)).to eq 10
    end

    it 'recieved a multiple line order and totals the prices' do
      order = [
        { name: "Pizza", price: 10 },
        { name: "Pizza", price: 10 }
      ]
      expect(subject.price(order)).to eq 20
    end
  end  
end
