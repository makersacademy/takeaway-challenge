require 'order'
require 'menu'

describe Order do
  it 'Select dishes and add to ordered_items array' do
    order = Order.new
    order.select_dishes(:pizza)
    order.select_dishes(:sausage)
    expect(order.ordered_items).to eq([:pizza, :sausage])
  end
  it 'Check total for order' do
    order = Order.new
    order.select_dishes(:pizza)
    order.select_dishes(:sausage)
    expect(order.total).to eq(6)
  end
  it 'Confirm order is complete' do
    order = Order.new
    order.select_dishes(:pizza)
    order.select_dishes(:sausage)
    expect(order.text_order_confirmation).to eq("Thank you! Your order was placed and will be delivered before 18:52")
  end
  it 'Order is incomplete' do
    order = Order.new
    expect(order.text_order_confirmation).to eq("Order incomplete")
  end
end