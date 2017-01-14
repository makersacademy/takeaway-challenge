require "order"

describe Order do
  subject(:order) {described_class.new}

  it "Be able to add a dish" do
    item = {item:"Curry" , quantity: 1}
    order.add_item(item)
    expect(order.check_order).to include(item)
  end

  it "Raises an error if the dish does not exist" do
    item = {item:"MADE UP!" , quantity: 1}
    error = "Item does not exist: Please select a different item"
    expect { order.add_item(item) }.to raise_error error
  end

end
