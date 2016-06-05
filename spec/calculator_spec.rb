require 'calculator'

describe Calculator do
  let(:order) { double :order }
  subject(:calculator) { described_class.new(order) }

  describe 'initialize' do
    it 'accepts one argument'do
      expect{Calculator.new(order)}.not_to raise_error
    end
  end
  describe 'responds_to' do
    it { is_expected.to respond_to(:summerize)}
    it { is_expected.to respond_to(:sum_quantity)}
    it { is_expected.to respond_to(:sum_price)}
  end
end
