require 'menu_item'

describe MenuItem do
  subject { described_class.new(number: "01", dish: "meat curry", price: "6.00") }

  describe '#initialize' do
    it 'returns the number, dish, and price of an item' do
      expect(subject.number).to eq "01"
      expect(subject.dish).to eq "meat curry"
      expect(subject.price).to eq "6.00"
    end
  end
end
