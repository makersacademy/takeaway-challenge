require 'calculator'

describe Calculator do

  # let(:item) { double(:item, name: "fish") }
  let(:subject) { Calculator.new("fish") }

  describe '#calculate_price' do
    it 'should return the price of an item' do
      expect(subject.calculate_price).to eq 8
    end
  end
end
