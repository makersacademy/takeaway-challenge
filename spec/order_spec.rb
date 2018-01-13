require 'order'
require 'menu'

describe Order do
  let(:menu) { double :menu, price: 1.00 }
  let(:notification) { double :notification, send_text: nil }
  subject(:order) { described_class.new(menu, notification) }

  context "#initialize" do
    it "should create an empty order" do
      expect(order.order_list).to be_empty
    end
  end

  context "#add_item" do
    it "should add one order of a menu item" do
      order.add("Poutine")
      expect(order.order_list["Poutine"]).to eq(Order::DEFAULT_QUANTITY)
    end
    it "should add multiple orders of a menu item" do
      order.add("Poutine")
      order.add("Poutine", 3)
      expect(order.order_list["Poutine"]).to eq(4)
    end
  end

  context "#total" do
    it "should give the customer a correct order total" do
      order.add("Poutine")
      order.add("Caesar")
      expect(order.total).to eq(2)
    end
    it "should give the customer a correct total when multiples of same item " do
      order.add("Poutine", 2)
      order.add("Caesar")
      order.add("Caesar")
      expect(order.total).to eq(4)
    end
  end

  context "#complete" do
    it "should send message to notification" do
      order.add("Poutine", 2)
      order.add("Caesar")
      message = "Thank you! Your total is £3.00 and your order has been placed."
      allow(notification).to receive(:send_text).with(message)
      order.complete
    end
  end
end
