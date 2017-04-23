require 'checkout'

RSpec.describe CheckOut do
  it {is_expected.to respond_to(:balance)}
  it {is_expected.to respond_to(:payment)}

  #describe '#balance' do
  #  it 'is expect to display balance' do
    #  cart = double(:cart)
    #  expect(subject.balance).to eq 'total order: £10'
  #  end
#  end
end
