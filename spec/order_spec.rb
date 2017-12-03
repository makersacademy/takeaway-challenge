require 'order'
require 'menu'

describe Order do
  let(:menu) { double(:menu, price: 1.00) }
  subject(:order) { described_class.new(menu) }

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
      expect(order.total).to eq(2.00)
    end
    it "should give the customer a correct total when multiples of same item " do
      order.add("Poutine", 2)
      order.add("Caesar")
      order.add("Caesar")
      expect(order.total).to eq(4.00)
    end
  end
end
