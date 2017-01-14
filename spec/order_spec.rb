require "order"

describe Order do
  subject(:order) {described_class.new}

  context "Item exists" do
    it "Be able to add a dish" do
      allow(order).to receive(:item_exists?).and_return(true)
      allow(order).to receive(:check_price).and_return(0.0)
      item = {item:"Item" , quantity: 1}
      order.add_item(item)
      expect(order.check_order).to include(item)
    end
  end

  context "Item doesn't exist" do
    it "Raises an error if the dish does not exist" do
      allow(order).to receive(:item_exists?).and_return(false)
      allow(order).to receive(:check_price).and_return(0.0)
      item = {item:"Item" , quantity: 1}
      error = "Item does not exist: Please select a different item"
      expect { order.add_item(item) }.to raise_error error
    end
  end

end
