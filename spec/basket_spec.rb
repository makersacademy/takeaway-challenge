require 'basket'

describe Basket do

  describe '#initialize' do
    it 'creates empty dishes array' do
      expect(subject.basket).to eq []
    end
  end

  describe '#add' do
    it 'adds item and quantity to basket in array' do
      subject.add("test", 1, 1)
      expect(subject.basket).to eq [["test", 1, 1]]
    end
  end

  describe '#check_basket' do
    it 'returns subtotal of basket' do
      subject.add('Chips', 3, 2.00)
      subject.add('Water 500ml', 1, 1.00)
      expect(subject.check_basket).to eq 7.0
    end
  end
end
