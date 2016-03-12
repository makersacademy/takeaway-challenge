require 'order'

describe Order do

  subject(:order) {described_class.new}

  it 'should have an empty order when initialized' do
    expect(order.items).to be_empty
  end

  it 'should add items and number of items to order list' do
    order.add_dish('pizza', 2)
    expect(order.items).to include('pizza' => 2)
  end

  it 'should update the list' do
    order.add_dish('pizza', 2)
    order.add_dish('pizza', 2)
    expect(order.items).to include('pizza' => 4)
  end
end
