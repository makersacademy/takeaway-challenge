require 'order'
require_relative './test_data'
describe Order do
  let(:customer_data) { [1, 2] }
  let(:menu_id) { 3 }
  let(:menu) { double(:menu, :data => TestData::menu_data) }
  subject(:order) { Order.new(menu) }

  subject(:order) { Order.new(menu) }
  it 'can create a dish based on data from the menu' do
    created_dish = order.create_dish(menu_id)
    expect(order.create_dish(menu_id, dish)).to have_att
  end

  it 'can build an order based on the selection from a customer' do
    order.build_order(customer_data)
    expect(order.items).to eq(1)
  end
end
