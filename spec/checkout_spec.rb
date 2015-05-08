require 'checkout'

describe Checkout do
  let(:checkout) { described_class.new }
  context 'when created' do
    it 'gets the shopping basket from inventory' do
      expect(checkout.get_shopping_basket).to be_a Hash
    end
    it 'has an empty total amount when created' do
      expect(checkout.total_amount).to eq 0
    end
    it 'has not been paid' do
      expect(checkout.paid).to be false
    end
  end

  context 'payment' do
    it 'knows that the total amount corresponds to what was ordered' do
      checkout.calculate('pizza' => 2, 'burger' => 3, 'chips' => 5)
      expect(checkout.total_amount).to eq 26
    end
    xit 'can be paid' do
    end
    xit 'can be cancelled' do
    end
    xit 'cannot be paid more than once' do
    end
    xit 'knows that it\'s been paid' do
    end
  end
end
