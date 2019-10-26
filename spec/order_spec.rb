require './lib/order'

describe Order do
# let (:menu_double) { double('menu') }

  order = Order.new("Kate", "07791202350", 2.97) 

  it "check that the entered total is the expected total" do
    expect(order.return_expected_total).to eq 2.97
  end

  it "check that it is not possible to add a cheese cake to the order" do
    expect { order.add_choice("cheese cake") }.to change { order.return_basket.length }.by(0)
  end

  it "check that it is possible to add a spring roll to the order" do
    expect { order.add_choice("spring roll") }.to change { order.return_basket.length }.by(1)
  end

  it "check that adding another spring roll to the order will increase the number of spring rolls" do
    expect { order.add_choice("spring roll") }.to change { order.return_basket["spring roll"] }.by(1)
  end

  it "check that adding a 3rd spring roll to the order will mean that the totals match" do
    order.add_choice("spring roll")
    expect(order.return_total).to eq order.return_expected_total
  end

  it "check that adding more to the order will mean that the totals dont match and the order fails" do
    order.add_choice("peking duck")
    expected_error = 'Totals do not match'
    expect { order.place_order }.to raise_error(RuntimeError, expected_error)
  end

#  it "check that an order with matching totals is placed" do
#    order2 = Order.new("Kate", "07791202350", 0.99) 
#    order2.add_choice("spring roll")
#    expect ( order2.place_order ).to eq "Thank you! Your order was placed and will be delivered before"
#  end

# Note that I don't know how to test the following:
# Time + 1 hour
# I can't send text messages
end
