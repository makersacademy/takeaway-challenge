require 'order'

describe Order do
  it 'can create an instance of oystercard' do
    expect(subject).to be_kind_of(Order)
  end
  it 'can respond to order_item' do
    expect(subject).to respond_to(:order_item)
  end
end
