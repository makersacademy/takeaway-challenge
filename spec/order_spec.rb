require 'order'

describe Order do

  let(:order) { order = Order.new }

  it 'should start with no dishes' do
    expect(order.dishes).to eq []
  end

  it 'should start with no total value' do
    expect(order.total).to eq 0
  end

end