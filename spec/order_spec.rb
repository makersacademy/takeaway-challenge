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
    order = Order.new
    choice1 = "large pierogi"
    choice2 = "supersize pierogi"
    order.add_to_order(choice1)
    order.add_to_order(choice2)
    expect(order.show_basket).to eq "large pierogi, supersize pierogi"
  end
end