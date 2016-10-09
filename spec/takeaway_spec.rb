require "takeaway"

describe Takeaway do
  let(:menu) do
    menu = double :menu
    allow(menu).to receive(:order).with("pie").and_return pie
    allow(menu).to receive(:order).with("pizza").and_return pizza
    allow(menu).to receive(:order).with("chips").and_return chips
    menu
  end
  let(:time) { double :time, now: Time.new(2016, 10, 10, 11, 30) }
  let(:sms) { double :sms }
  let(:pie) { Dish.new("pie", 5) }
  let(:pizza) { Dish.new("pizza", 6) }
  let(:chips) { Dish.new("chips", 3) }
  subject(:takeaway) { described_class.new(menu, time, sms)}

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
    it "shows a total of zero when no items ordered" do
      expect(takeaway.review_order).to eq "Order total: £0"
    end

    it "shows an ordered item with cost and total cost" do
      takeaway.order_item("pie")

      expect(takeaway.review_order).to eq "1 x pie: £5, Order total: £5"
    end

    it "shows all ordered items and costs" do
      takeaway.order_item("pie")
      takeaway.order_item("pizza")

      expect(takeaway.review_order).to eq "1 x pie: £5, 1 x pizza: £6, Order total: £11"
    end

    it "shows all ordered items with different quantities and total costs" do
      takeaway.order_item("pie")
      takeaway.order_item("pizza", 2)
      takeaway.order_item("chips", 3)

      expect(takeaway.review_order).to eq "1 x pie: £5, 2 x pizza: £12, 3 x chips: £9, Order total: £26"
    end
  end

  context "checking out an order" do
    it "raises an error if no items have been ordered" do
      expect { takeaway.checkout(5) }.to raise_error "You haven't ordered any items!"
    end

    it "raises an error if no amount is given" do
      takeaway.order_item("pie")

      expect { takeaway.checkout }.to raise_error "Please pay the correct amount!"
    end

    it "raises an error if the wrong amount is given" do
      takeaway.order_item("pie")

      expect { takeaway.checkout(2) }.to raise_error "Please pay the correct amount!"
      expect { takeaway.checkout(6) }.to raise_error "Please pay the correct amount!"
    end

    it "checks out an order when given the correct amount" do
      allow(sms).to receive(:send)
      takeaway.order_item("pie")
      expect(takeaway.checkout(5)).to eq "Thank you! Your order was placed and will be delivered before 12:30."
    end

    it "sends an SMS to confirm order has been placed" do
      message = "Thank you! Your order was placed and will be delivered before 12:30."
      allow(sms).to receive(:send).with(message)
      takeaway.order_item("pie")
      takeaway.checkout(5)

      expect(sms).to have_received(:send).with(message)
    end

  end

end
