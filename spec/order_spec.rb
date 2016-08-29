require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:dish1) {double(:dish, name: "Pizza", price: 1.99)}
  let(:dish2) {double(:dish, name: "Burger", price: 2.11)}

  describe "#add_item" do
    before(:each) do
      order.add_item(dish1, 2)
    end

    it "adds an item to the entire order" do
      expect(order.instance_variable_get(:@order_content)).to be_include(dish1)
    end

    it "groups the same dishes into one item" do
      order.add_item(dish1, 1)
      sum_value = order.instance_variable_get(:@order_content)[dish1][:sum]
      expect(sum_value).to eq 5.97
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

    it "raises error if the received amount is different, than total" do
      order.add_item(dish2, 3)
      expect{order.checkout_order(3.01)}.to raise_error(RuntimeError)
    end
  end

  describe "#total" do

    it "returns zero if no dish added to the order" do
      expect(order.total).to eq 0
    end

    it "returns the total value of the current order" do
      order.add_item(dish2, 3)
      order.add_item(dish1, 2)
      expect(order.total).to eq 10.31
    end
  end

  describe "#order_summary" do
    it "returns the summary of the current order" do
      order.add_item(dish1, 2)
      order.add_item(dish2, 3)
      expect(order.order_summary).to eq("Pizza x2 = 3.98, Burger x3 = 6.33")
    end
  end

end
