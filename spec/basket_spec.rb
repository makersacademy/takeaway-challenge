require 'basket'
describe Basket do
  it 'initializes with an empty array' do
    expect(subject.current_order).to eq []
  end

  describe '#total' do
    it 'returns the total price of all the items in the basket' do
      subject.current_order = [
            { name: "Chicken Wings", price: "3.00", quantity: 1 },
            { name: "Burger", price: "4.50", quantity: 2 }
      ]
      expect(subject.total).to eq "12.00"
    end
    it ''
  end
end
