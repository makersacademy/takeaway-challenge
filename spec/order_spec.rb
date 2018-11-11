require 'order'
require_relative './test_data'
describe Order do
  let(:menu_ids) { [3, 2] }
  let(:menu_id) { 3 }
  let(:menu) { double(:menu, :data => TestData::menu_data) }
  subject(:order) { Order.new(menu) }

  subject(:order) { Order.new(menu) }
  it 'can create a dish based on data from the menu' do
    created_dish = order.create_dish(menu_id)
    expect(created_dish).to have_attributes(name: menu.data.last[:name],
                                            description: menu.data.last[:description],
                                            price: menu.data.last[:price])
  end

  it 'can build an order based on the selection from a customer' do
    order.build(menu_ids)
    expect(order.items.size).to eq(menu_ids.size)
  end

  it 'can print an order' do
    order.build(menu_ids)
    expect{ order.print }.to output{ TestData::expected_order_print_output }.to_stdout
  end

  it 'can be varified' do
    order.varify
    expect(order.varified).to eq(true)
  end
end
