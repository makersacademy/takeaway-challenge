require 'order'

describe Order do
  it 'can create an Order' do
    expect(Order.new).to be_a_kind_of(Order)
  end
end
