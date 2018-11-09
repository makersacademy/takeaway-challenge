require 'Order'

describe Order do

  it 'puts the requested items into the order' do
    takeaway = Takeaway.new
    takeaway.populate_menu
    order = Order.new("1 Chicken jalfrezi, 2 Lamb bhuna, £26.00", takeaway.menu)
    expect(order.order_items).to eq([{ name: "Chicken jalfrezi", quantity: 1 }, { name: "Lamb bhuna", quantity: 2 }])
  end

  it 'stores the provided total as a number' do
    takeaway = Takeaway.new
    takeaway.populate_menu
    order = Order.new("1 Chicken jalfrezi, £8.00", takeaway.menu)
    expect(order.provided_total).to eq 8
  end

  it 'correctly calculates the total if more than one of a dish is ordered' do
    takeaway = Takeaway.new
    takeaway.populate_menu
    order = Order.new("2 Chicken jalfrezi, £16.00", takeaway.menu)
    expect(order.calculated_total).to eq 16
  end

  it 'raises an error if an incorrect total is given when ordering' do
    takeaway = Takeaway.new
    takeaway.populate_menu
    expect { Order.new("1 Chicken jalfrezi, £7.00", takeaway.menu) }.to raise_error(RuntimeError, "Wrong total")
  end

end
