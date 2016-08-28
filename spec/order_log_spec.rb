require 'order_log'

describe OrderLog do

  subject(:order_log) {described_class.new}
  let(:Order) {double :Order }
  let(:order) { double :order }
  let(:dish1) { double :dish }
  let(:dish2) { double :dish2 }

  before(:each) do
    allow(Order).to receive(:new) {order}
    allow(order).to receive(:add_item) {nil}
    allow(order).to receive(:total) {3.98}
    allow(dish1).to receive(:name) {"Pizza"}
    allow(dish1).to receive(:price) {1.99}
    allow(dish2).to receive(:name) {"Burger"}
    allow(dish2).to receive(:price) {2.11}
  end

  describe "#start_order" do
    it "instantiate an order and assign it to the current_order" do
      order_log.start_order
      expect(order_log.instance_variable_get(:@current_order)).not_to eq nil
    end

  end

  describe "#add_item" do

    before(:each) do
      order_log.start_order
    end

    it "returns confirmation if 1 item is added to the order" do
      expect(order_log.add_item(dish2, 1)).to eq("1x burger has been added to your basket")
    end

    it "returns confirmation if 2 or more items are added to the order" do
      expect(order_log.add_item(dish2, 3)).to eq("3x burgers have been added to your basket")
    end
  end

  describe "#checkout_order" do
    it "raises error if the received amount is different, than the total value of the order" do
      order_log.start_order
      order_log.add_item(dish2, 2)
      expect{order_log.checkout_order(3.01)}.to raise_error(RuntimeError)
    end

    it "records the completed order in the order history" do
      order_log.start_order
      order_log.add_item(dish1, 2)
      order_log.checkout_order(3.98)
      expect(order_log.instance_variable_get(:@order_history)).to be_include(order)
    end

    it "set the current order to nil" do
      order_log.start_order
      order_log.add_item(dish1, 2)
      order_log.checkout_order(3.98)
      expect(order_log.instance_variable_get(:@current_order)).to eq nil
    end

  end
end
