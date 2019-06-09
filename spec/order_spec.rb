require 'order'

describe Order do
  it 'is initialized with an empty basket' do
    order = Order.new
    expect(order).to have_attributes(basket: [])
  end

  it 'adds multiple items to basket' do
    order = Order.new
    choice1 = "large pierogi"
    choice2 = "supersize pierogi"
    order.add_to_order(choice1)
    expect(order.add_to_order(choice2)).to eq nil
  end

  it 'displays basket' do
    pierogi = double('pierogi')
    item = ["small pierogi", 1]
    order = Order.new
    allow(pierogi).to receive(:pick) { item }
    order.add_to_order("small pierogi")
    expect(order.show_basket).to eq "small pierogi - 1"
  end

  it 'totals up the basket' do
    order = Order.new
    item = ["small pierogi", 1]
    pierogi = double('pierogi')
    allow(pierogi).to receive(:pick) { item }
    order.add_to_order("small pierogi")
    expect(order.total).to eq 1
  end
end