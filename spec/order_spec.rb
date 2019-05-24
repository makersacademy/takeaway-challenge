require 'order'

describe Order do
  let(:menu) { double :menu, price: 1.00 }
  subject(:ordermock) { described_class.new(menu) }

  context "#initialize" do
    it "should have a menu of items" do
      expect(subject.menu).not_to be_nil
    end
  end

  context "#add_item" do
    it "should add one order of a menu item" do
      ordermock.add("Pizza")
      expect(ordermock.order_list["Pizza"]).to eq(Order::DEFAULT_QUANTITY)
    end
    it "should add multiple orders of a menu item" do
      ordermock.add("Pizza")
      ordermock.add("Pizza", 3)
      expect(ordermock.order_list["Pizza"]).to eq(4)
    end
  end

  context "#total" do
    it "should give the customer a correct order total" do
      ordermock.add("Burger")
      ordermock.add("Pizza")
      expect(ordermock.total).to eq(2)
    end
  end

  
end
