require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new }
  let(:food) { { Wings: 1, Pizza: 2 } }
  let(:prices) { { Wings: 7.63, Pizza: 5.48 } }
  describe '#sumarise' do
    it 'Sums the basket using the order and price' do
      summary = "1x Wings = £7.63, 2x Pizza = £10.96"
      expect(checkout.sumarise(food, prices)).to eq summary
    end
  end
end
