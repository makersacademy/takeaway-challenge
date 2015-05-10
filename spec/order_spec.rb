require 'order'

describe Order do

  it 'takes two arguments to initialize' do
    customer = double :customer
    takeaway = double :takeaway
    expect { order = Order.new(customer, takeaway) }.not_to raise_error
  end

  it 'allows items to be added to and verified as being on an order' do
    customer = double :customer
    takeaway = double :takeaway
    allow(takeaway).to receive(:item_price).with("Pie and chips").and_return(5)
    order = Order.new(customer, takeaway)
    order.add_order_line("Pie and chips", 2)
    expect(order.order_line(0)).to eq ["Pie and chips", 2, 10]
  end

  it 'calculates an order total from given items and quantities' do
    customer = double :customer
    takeaway = double :takeaway
    allow(takeaway).to receive(:item_price).with("Pie and chips").and_return(5)
    allow(takeaway).to receive(:item_price).with("Chip butty").and_return(3)
    order = Order.new(customer, takeaway)
    order.add_order_line("Pie and chips", 2)
    order.add_order_line("Chip butty", 3)
    expect(order.total).to eq(19)
  end

end
