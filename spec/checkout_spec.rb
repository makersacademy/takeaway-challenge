require 'checkout'

RSpec.describe CheckOut do
  it {is_expected.to respond_to(:balance)}
  it {is_expected.to respond_to(:payment)}

  describe '#balance' do
    it 'is expect to display balance' do
      cart = ['lamb doner', 'lamb doner', 'chicken doner']
      expect(subject.balance(cart)).to eq 'total order: £14.5'
    end
  end

  describe '#payment' do
    it 'takes payment based on #outstanding_balance' do
      cart = ['lamb doner' , 'lamb doner', 'chicken doner']
      subject.balance(cart)
      expect(subject.payment(14.5)).to eq 'thank you for your payment'
    end
    it 'raises an error if payment is not correct' do
      cart = ['lamb doner' , 'lamb doner', 'chicken doner']
      subject.balance(cart)
      total_balance = 15
      expect {subject.payment(13)}.to raise_error "Not the correct amount"
    end
    it 'raises an error if trolley is empty' do
      expect {subject.payment(20)}.to raise_error "Nothing to pay for"
    end
  end
end
