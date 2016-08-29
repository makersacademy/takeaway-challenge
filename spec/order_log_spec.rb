require 'order_log'

describe OrderLog do

  subject(:order_log) {described_class.new}
  let(:Order) {double :Order }
  let(:order) { double(:order, add_item: nil, total: 3.98, checkout_order: nil) }
  let(:dish1) { double(:dish, name: "Pizza", price: 1.99) }
  let(:dish2) { double(:dish, name: "Burger", price: 2.11) }

  before(:each) do
    allow(Order).to receive(:new) {order}
    order_log.start_order
  end

  describe "#start_order" do

    it "instantiate an order and assign it to the current_order" do
      expect(order_log.instance_variable_get(:@current_order)).not_to eq nil
    end

    it "raises error if there is a current order" do
      expect{order_log.start_order}.to raise_error(RuntimeError)
    end
  end

  describe "#add_item" do

    it "returns confirmation if 1 item is added to the order" do
      message = "1x burger has been added to your basket"
      expect(order_log.add_item(dish2, 1)).to eq(message)
    end

    it "returns confirmation if 2 or more items are added to the order" do
      message = "3x burgers have been added to your basket"
      expect(order_log.add_item(dish2, 3)).to eq(message)
    end
  end

  describe "#order_summary" do
    it "calls the order_summary on the order" do
      expect(order).to receive(:order_summary)
      order_log.order_summary
    end
  end

  describe "#checkout_order" do
    before(:each) do
      order_log.add_item(dish1, 2)
    end

    it "passes the amount to the order" do
      expect(order).to receive(:checkout_order).with(3.98)
      order_log.checkout_order(3.98)
    end

    it "records the completed order in the order history" do
      order_log.checkout_order(3.98)
      order_history = order_log.instance_variable_get(:@order_history)
      expect(order_history).to be_include(order)
    end

    it "set the current order to nil" do
      order_log.checkout_order(3.98)
      expect(order_log.instance_variable_get(:@current_order)).to eq nil
    end
  end

  describe "#total" do
    it "calls the total method on the order" do
      expect(order).to receive(:total)
      order_log.total
    end
  end

end
