require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:dish1) {double :dish}
  let(:dish2) {double :dish}

  before(:each) do
    allow(dish1).to receive(:name) {"Pizza"}
    allow(dish1).to receive(:price) {1.99}
    allow(dish2).to receive(:name) {"Burger"}
    allow(dish2).to receive(:price) {2.11}
  end

  describe "#add_item" do
    it "adds an item to the entire order" do
      order.add_item(dish1, 2)
      expect(order.instance_variable_get(:@order_content)).to be_include({dish: dish1, quantity: 2})
    end

  end

  describe "#complete?" do

    before(:each) do
      order.add_item(dish1, 2)
    end

    it "returns false if the order is not complete" do
      order.checkout_order(3.98)
      expect(order).to be_complete
    end
    it "returns true if the order is complete" do
      expect(order).not_to be_complete
    end
  end

  describe "#checkout_order" do
    it "finalises order, by recording the checkout value" do
      order.add_item(dish2, 3)
      order.checkout_order(6.33)
      expect(order.instance_variable_get(:@checkout_value)).to eq 6.33
    end

    it "raises error if the method is called but no dish was recorded" do
      expect{order.checkout_order(2.99)}.to raise_error(RuntimeError)
    end
  end
end
