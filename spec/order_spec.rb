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

  it 'returns an order in a specified format' do
    takeaway = double :takeaway
    allow(takeaway).to receive(:item_price).with("Pie and chips").and_return(5)
    allow(takeaway).to receive(:item_price).with("Chip butty").and_return(3)
    allow(takeaway).to receive(:name).and_return("Bill's Chippy")
    customer = double :customer
    allow(customer).to receive(:name).and_return("Daniel")
    order = Order.new(customer, takeaway)
    order.add_order_line("Pie and chips", 2)
    order.add_order_line("Chip butty", 3)
    expected_order = []
    expected_order << customer.name
    expected_order << takeaway.name
    expected_order << [["Pie and chips", 2, 10], ["Chip butty", 3, 9]]
    expected_order << 19
    expected_order << :open
    expect(order.order).to eq(expected_order)
  end

  xit 'lets you place an order' do
    # This is in the feature test, but could use a unit test as well
  end

end
