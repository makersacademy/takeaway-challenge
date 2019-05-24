require 'order'
require 'menu'

describe Order do
  let(:order) { Order.new }
  # let(:menu) { Menu.new }
  it 'Select dishes and add to ordered_items array' do
    order.select_dishes(:pizza, 1)
    order.select_dishes(:sausage, 1)
    expect(order.ordered_items).to eq([:pizza, :sausage])
  end
  it 'Check total for order' do
    order.select_dishes(:pizza, 1)
    order.select_dishes(:sausage, 1)
    expect(order.total).to eq(6)
  end
  it 'Confirm order is complete' do
    order.select_dishes(:pizza, 1)
    order.select_dishes(:sausage, 1)
    expect(order.text_order_confirmation).to eq("Thank you! Your order was placed and will be delivered before 18:52")
  end
  it 'Order is incomplete' do
    expect(order.text_order_confirmation).to eq("Order incomplete")
  end
end