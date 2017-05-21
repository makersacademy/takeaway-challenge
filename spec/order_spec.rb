require 'order'


describe Order do

subject(:order) { described_class.new('menu') }

  it 'creates the new order array' do
    expect(order.new_order).to eq ([])
  end
end
