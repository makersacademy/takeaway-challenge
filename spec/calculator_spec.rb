require 'calculator'

describe Calculator do

  let(:item) { double(:item, name: "fish") }
  let(:subject) { Calculator.new(item) }

  describe '#calculate_price' do
    it 'should return the price of an item' do
      expect(subject.calculate_price).to eq 8
    end

  end

end

#potentially move prices ?
