require 'order'

describe Order do
  it "Should select from the menu" do
    menu = Menu.new
    order = Order.new(menu)
    expect{order.select(1) }.to change { order.contents }
    order.select(7)
    expect(order.contents).to include(menu.choices[6])
    order.select(1)
    expect(order.contents).to include(menu.choices[0])
  end

  it "Should have a total matching the sum of dishes" do
    menu = Menu.new
    order = Order.new(menu)
    order.select(2)
    order.select(6)
    expect(order.price?).to eq(5)
    order.select(8)
    expect(order.price?).to eq(7)
  end

  it "Should reassure the customer their order shall arrive on time" do
  #  implement standin for twilio API here
  end

end
