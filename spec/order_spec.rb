require 'order'
require 'menu'


describe Order do

subject(:order) { described_class.new('menu') }

  it 'creates the new order array' do
    expect(order.new_order).to eq ([])
  end

  it 'allows customer to choose the item from the menu' do
    order.choose_item('pizza')
    expect(order.new_order).to include('pizza')
  end
end
