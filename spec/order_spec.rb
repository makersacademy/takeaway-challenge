require 'order'
require_relative './test_data'
describe Order do
  let(:menu_ids) { [1, 2, 3, 3, 2, 1] }
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
    order.build_order(menu_ids)
    expect(order.items.size).to eq(menu_ids.size)
  end
end
