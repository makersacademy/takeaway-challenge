require 'takeaway'

describe TakeAway do

  subject(:restaurant) { described_class.new(menu, order_log, twilio)}
  let(:menu) {double(:menu, menu: {1012 => dish1, 1013 => dish2})}
  let(:order_log) {double(:order_log, total: 10.19, add_item: nil)}
  let(:dish1) {double(:dish, name: "Pizza", price: 1.99)}
  let(:dish2) {double(:dish, name: "Burger", price: 2.11)}
  let(:twilio) {double(:twilio, new: client)}
  let(:client) {double :client}

  before(:each) do
    allow(order_log).to receive(:start_order)
    allow(order_log).to receive(:checkout_order)
    allow(client).to receive_message_chain(:messages, :create)
  end

  describe "#start_order" do
    it "calls the start_order method on the order_log" do
      expect(order_log).to receive(:start_order)
      restaurant.start_order
    end
  end

  describe "#show_menu" do
    it "calls the the #menu on Menu" do
      expect(menu).to receive(:menu)
      restaurant.show_menu
    end

    it "returns a formatted menu" do
      m = "ID: 1012 Name: Pizza, Price: 1.99 | ID: 1013 Name: Burger, Price: 2.11"
      expect(restaurant.show_menu).to eq m
    end
  end

  describe "#add_item" do
    it "passes the item to the order log" do
      expect(order_log).to receive(:add_item).with(dish1, 2)
      restaurant.add_item(1012, 2)
    end

    it "raises error if quantity is less than 1" do
      expect{restaurant.add_item(1012, 0)}.to raise_error(RuntimeError)
    end

    it "raises error if the quantity is not a fixnum" do
      expect{restaurant.add_item(1013, 3.5)}.to raise_error(RuntimeError)
    end

    it "raises error if dish is not available" do
      expect{restaurant.add_item(9999, 2)}.to raise_error(RuntimeError)
    end
  end

  describe "#summary" do
    it "calls order_summary on the order log" do
      expect(order_log).to receive(:order_summary)
      restaurant.summary
    end
  end

  describe "#total" do

    it "calls total method on order log" do
      expect(order_log).to receive(:total)
      restaurant.total
    end

    it "returns the sum of the current order" do
      restaurant.add_item(1012, 3)
      restaurant.add_item(1013, 2)
      expect(restaurant.total).to eq 10.19
    end
  end

  describe "#checkout" do
    it "passes the checkout value to the order_log" do
      expect(order_log).to receive(:checkout_order).with(11.11)
      restaurant.checkout(11.11)
    end

    it "sends confirmation text message" do
      restaurant.add_item(1012, 3)
      expect(client).to receive_message_chain(:messages, :create)
      restaurant.checkout(5.97)
    end

    it "returns confirmation if checkout is completed" do
      conf = "Checkout completed. Confirmation has been sent in a text message"
      restaurant.add_item(1012, 3)
      expect(restaurant.checkout(5.97)).to eq conf
    end
  end
end
