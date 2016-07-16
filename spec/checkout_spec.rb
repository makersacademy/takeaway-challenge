require 'checkout'

describe Checkout do

  it 'has a method to dispatch texts' do
    expect(subject).to respond_to :confirm_order
  end

end
