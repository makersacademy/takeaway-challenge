require "order"

describe Order do
  subject(:order) {described_class.new}

  context "Item exists" do
    it "Be able to add a dish" do
      allow(order).to receive(:item_exists?).and_return(true)
      allow(order).to receive(:check_price).and_return(0.0)
      item = {item: "Item" , quantity: 1}
      order.add_item(item)
      expect(order.check_order).to include(item)
    end

    it "Check that the total is correct" do
      allow(order).to receive(:check_price).and_return(10.0)
      allow(order).to receive(:item_exists?).and_return(true)
      item1 = {item:"Item 1" , quantity: 1}
      order.add_item(item1)
      item2 = {item:"Item 2" , quantity: 1}
      order.add_item(item2)
      expect(order.total).to eq 20
    end
  end

  context "Item doesn't exist" do
    it "Raises an error if the dish does not exist" do
      allow(order).to receive(:item_exists?).and_return(false)
      allow(order).to receive(:check_price).and_return(0.0)
      item = {item: "Item" , quantity: 1}
      error = "Item does not exist: Please select a different item"
      expect { order.add_item(item) }.to raise_error error
    end
  end

  it "Raises an error if you try and complete an empty order" do
    error = "You have not given any items to order"
    expect { order.complete_order }.to raise_error error
  end

  it "Sends a text message once the orer has been completed" do
    #allow(order).to receive(:complete_order).and_return(true)
    item1 = {item:"Item 1" , quantity: 2}
    order.add_item(item1)
    expect(order.complete_order).to eq true
  end

end
