require "order"

describe Order do
  subject(:order) {described_class.new}

  context "Item exists" do
    describe "#check_order" do
      it "Be able to add a dish" do
        allow(order).to receive(:item_exists?).and_return(true)
        allow(order).to receive(:check_price).and_return(0.0)
        item = {item: "Item" , quantity: 1}
        order.add_item(item)
        expect(order.check_order).to include(item)
      end
    end

    describe "#total" do
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

    describe "#total" do
      it "Check that the item price is correct" do
        allow(order).to receive(:check_price).and_return(3.0)
        allow(order).to receive(:item_exists?).and_return(true)
        item1 = {item:"Item 1" , quantity: 2}
        order.add_item(item1)
        expect(order.total).to eq 3.0
      end
    end
  end

  context "Item doesn't exist" do
    describe "#add_item" do
      it "Raises an error if the dish does not exist" do
        allow(order).to receive(:item_exists?).and_return(false)
        allow(order).to receive(:check_price).and_return(0.0)
        item = {item: "Item" , quantity: 1}
        error = "Item does not exist: Please select a different item"
        expect { order.add_item(item) }.to raise_error error
      end
    end
  end

  context "Completed orders" do
    describe "#complete_order" do
      it "Raises an error if order empty" do
        error = "You have not given any items to order"
        expect { order.complete_order }.to raise_error error
      end

      it "Sends a text message on completion" do
        allow(order).to receive(:complete_order).and_return(true)
        item1 = {item:"Item 1" , quantity: 2}
        order.add_item(item1)
        expect(order.complete_order).to eq true
      end
    end
  end

  describe "Defaults" do
    it "initialize order variable" do
      expect(order.order).to eq []
    end

    it "initialize total variable" do
      expect(order.total).to eq 0.0
    end
  end
end
