require "takeaway"

describe Takeaway do
  let(:menu) do
    menu = double :menu
    allow(menu).to receive(:order).with("pie").and_return pie
    allow(menu).to receive(:order).with("pizza").and_return pizza
    menu
  end
  let(:order) do
    order = double :order
    allow(order).to receive(:add_item)
    allow(order).to receive(:summary).and_return "Order summary"
    allow(order).to receive(:empty?).and_return false
    allow(order).to receive(:total_cost).and_return 5
    order
  end
  let(:time) { double :time, now: Time.new(2016, 10, 10, 11, 30) }
  let(:sms) { double :sms }
  let(:pie) { Dish.new("pie", 5) }
  let(:pizza) { Dish.new("pizza", 6) }
  subject(:takeaway) { described_class.new(menu, order, time, sms)}

  it "has a menu with a list of dishes and prices" do
    allow(menu).to receive(:items).and_return [pie, pizza]

    expect(takeaway.view_menu).to eq [pie, pizza]
  end

  context "ordering menu items" do
    it "orders an item from the menu" do
      expect(takeaway.order_item("pie").item).to eq pie
    end

    it "orders a given quantity of an item from the menu" do
      expect(takeaway.order_item("pie", 2).quantity).to eq 2
    end
  end

  context "reviewing an order" do
    it "shows an order summary" do
      expect(takeaway.review_order).to eq "Order summary"
    end
  end

  context "checking out an order" do
    it "raises an error if no items have been ordered" do
      allow(order).to receive(:empty?).and_return true
      expect { takeaway.checkout(5) }.to raise_error "You haven't ordered any items!"
    end

    it "raises an error if the wrong amount is given" do
      expect { takeaway.checkout(2) }.to raise_error "Please pay the correct amount!"
      expect { takeaway.checkout(6) }.to raise_error "Please pay the correct amount!"
    end

    it "checks out an order when given the correct amount" do
      allow(sms).to receive(:send)
      expect(takeaway.checkout(5)).to eq "Thank you! Your order was placed and will be delivered before 12:30."
    end

    it "sends an SMS to confirm order has been placed" do
      message = "Thank you! Your order was placed and will be delivered before 12:30."
      allow(sms).to receive(:send).with(message)
      takeaway.checkout(5)

      expect(sms).to have_received(:send).with(message)
    end
  end
end
