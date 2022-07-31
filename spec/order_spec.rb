require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(Menu.new) }
  it 'It is a object order' do
    expect(order).to be_an(Object)
  end
  it 'Should respond to #add' do
    expect(order).to respond_to(:add_item).with(2).argument
  end
  it 'Add menu item' do
    expect(order.add_item('Tomato soup', quantity = 1)).to eq(order.instance_variable_get(:@order))
  end
  it 'Remove menu item' do
    expect(order.remove_item('Tomato soup')).to eq(order.instance_variable_get(:@order))
  end
  it 'Add customer details' do
    expect(order.add_customer_details('Street 12, New York, 12345', "01234567890")).to eq(order.instance_variable_get(:@customer_details))
  end
  it 'Counts order total' do
    order.add_item('Tomato soup', quantity = 2)
    expect(order.order_total).to eq(30)
  end
end
