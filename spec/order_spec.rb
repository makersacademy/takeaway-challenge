require 'order'
require 'support/shared_examples_for_food_list'

describe Order do
  it_behaves_like FoodList

  it 'can show an orders total'  do
    item_double_1 = double('item_double_1', price: 100)
    item_double_2 = double('item_double_2', price: 250)
    item_double_3 = double('item_double_3', price: 250)

    items = [item_double_1, item_double_2, item_double_3]

    my_order = Order.new(items)

    expect(my_order.show_total).to eq("£6.00")
  end

  it 'can show an orders total if no items ordered' do
    my_order = Order.new

    expect(my_order.show_total).to eq("£0.00")
  end

  it 'can add an item to the order' do
    my_order = Order.new
    item_double = double('item_double')

    my_order.add_item(item_double)

    expect(my_order.items).to include(item_double)
  end

  it 'can add multiple items to the order' do
    my_order = Order.new
    item_double_1 = double('item_double')
    item_double_2 = double('item_double')
    item_double_3 = double('item_double')

    my_order.add_item(item_double_1)
    my_order.add_item(item_double_2)
    my_order.add_item(item_double_3)

    expect(my_order.items).to include(item_double_1, item_double_2, item_double_3)
  end
end
