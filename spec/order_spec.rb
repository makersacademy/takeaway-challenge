require 'order'

describe Order do
  it 'should store the items ordered' do
    expect(subject).to respond_to(:items_ordered)
  end
  it 'should store the price of each item ordered' do
    expect(subject).to respond_to(:items_price)
  end
end
