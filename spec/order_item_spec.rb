require 'order_item'

describe OrderItem do
  subject { described_class.new(number: "01", dish: "meat curry", price: "6.00", quantity: "2") }

  describe '#initialize' do
    it 'returns the number, dish, and price of an item' do
      expect(subject.number).to eq "01"
      expect(subject.dish).to eq "meat curry"
      expect(subject.price).to eq "6.00"
      expect(subject.quantity).to eq "2"
    end
  end
end
