require 'order'

describe Order do
  let(:order) { Order.new }
  it 'is an empty list by default' do
    expect(subject.items).to be_empty
  end

  it 'can add items to an order' do
    new_order = subject.order("Big Mac")
    expect(new_order).to include("Big Mac")
  end

end
