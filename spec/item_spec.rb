require 'item'

describe Item do
  let(:calculator) { double(:calculator, calculate_price: 8) }
  let(:calculator_class) { double(:calculator_class, new: calculator) }

  let(:subject) { Item.new("Fish", calculator_class) }

  describe '#intialize' do
    it 'should return the item name' do
      expect(subject.name).to eq 'Fish'
    end

    it 'should run calculator' do
      expect(calculator).to receive(:calculate_price)
      subject.price
    end

    it 'should set the item price' do
      expect(subject.price).to eq 8
    end
  end
end
