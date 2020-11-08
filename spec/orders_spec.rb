require 'orders'

describe Order do
  let(:portuguese_menu) { double("Menu") }

  it "allow the users to choose the dishes" do
    order = Order.new(portuguese_menu)
    allow(portuguese_menu).to receive(:dishes) { [{name: "Bacalhau com natas", price: 7.5}] }
    order.take_order(1)
    expect(order.orders_list).to include(1)
  end

  it "will raise an error in the case the user enter an unexisting number" do
    order = Order.new(portuguese_menu)
    allow(portuguese_menu).to receive(:dishes) { [{name: "Bacalhau com natas", price: 7.5}] }
    expect { order.take_order(2) }.to raise_error "The number you chose it's not associated to any dish"
  end

  it "allow the users to choose more than one dish" do
    order = Order.new(portuguese_menu)
    allow(portuguese_menu).to receive(:dishes) { [{name: "Bacalhau com natas", price: 7.5}, {name: "Ameijoas a Bulhao Pato", price: 8}, {name: "Polvo a Lagareiro", price: 10}] }
    order.take_order(1)
    order.take_order(3)
    expect(order.orders_list).to include(1, 3)
  end
end
