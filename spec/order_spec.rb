require 'order'

describe Order do
  context "#initialize" do
    it "should create an empty order" do
      expect(subject.order).to be_empty
    end
  end

  context "#add_item" do
    it "should add one order of a menu item" do
      subject.add("Poutine")
      expect(subject.order["Poutine"]).to eq(Order::DEFAULT_QUANTITY)
    end
    it "should add multiple orders of a menu item" do
      subject.add("Poutine")
      subject.add("Poutine", 3)
      expect(subject.order["Poutine"]).to eq(4)
    end
  end
end
