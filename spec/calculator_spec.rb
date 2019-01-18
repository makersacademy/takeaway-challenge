require 'calculator'

describe Calculator do

  let(:subject) { Calculator.new }

  describe '#calculate_price' do
    it 'should return the price of an item' do
      expect(subject.calculate_price("Fish")).to eq 8
    end
  end
end
