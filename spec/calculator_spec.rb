require 'calculator'

describe Calculator do
  let(:order) { double :order }
  subject(:calculator) { described_class.new({'oreo' => 1}) }

  describe 'initialize' do
    it 'accepts one argument'do
      expect{Calculator.new(order)}.not_to raise_error
    end
  end

  describe 'responds_to' do
    it { is_expected.to respond_to(:summerize)}
    it { is_expected.to respond_to(:sum_price)}
    # it { is_expected.to respond_to(:sum_quantity)}
  end

  describe '#sum_price' do
    context 'when one oreo costing £3 is inputted' do
      it 'should sum to 3' do
        expect(calculator.sum_price).to eq 3
      end
    end
    context 'when two oreo costing £3 is inputted' do
      subject(:calculator) { described_class.new({'oreo' => 2}) }
      it 'should sum to 6' do
        expect(calculator.sum_price).to eq 6
      end
    end
    context 'when two oreo costing £3 and one milkshae costing £2 is inputted' do
      subject(:calculator) { described_class.new({'oreo' => 2, 'cake' => 1}) }
      it 'should sum to 8' do
        expect(calculator.sum_price).to eq 8
      end
    end
  end

  # describe '#sum_quantity' do
  #   context 'when one oreo is inputted' do
  #     it 'should sum to 1' do
  #       expect(calculator.sum_quantity).to eq 1
  #     end
  #   end
  #   context 'when two oreo is inputted' do
  #     subject(:calculator) { described_class.new({'oreo' => 2}) }
  #     it 'should sum to 1' do
  #       expect(calculator.sum_quantity).to eq 2
  #     end
  #   end
  #   context 'when two oreo and one milkshake is inputted' do
  #     subject(:calculator) { described_class.new({'oreo' => 2, 'milkshake' => 1}) }
  #     it 'should sum to 3' do
  #       expect(calculator.sum_quantity).to eq 3
  #     end
  #   end
  # end
end
