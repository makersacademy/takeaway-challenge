require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new }
  let(:order) { {shrimp: 1, burger: 2} }
  let(:prices) { {burger: 2.44, shrimp: 2.33} }

  describe '#sum_each' do
    it 'should sum the basket from two lists, the order and price' do
      summary = '1x shrimp = £2.33, 2x burger = £4.88'
      expect(checkout.sum_each(order, prices)).to eq summary
    end
  end

  describe '#sum_total' do
    it 'should sum the basket total from order and price' do
      expect(checkout.sum_total(order, prices)).to eq '£7.21'
    end
  end

end
