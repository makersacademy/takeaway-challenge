require 'order'

describe Order do
  describe "#order" do
    it "expects it to start out empty" do
      expect(subject.order).to be_empty
    end
  end
  describe "#add" do
    it "expects it to add an item to an order" do
      subject.add("Pizza",1)
      expect(subject.order.last).to eq({item: "Pizza", num: 1})
    end
    it "expects it to add multiple items to an order" do
      subject.add("Pizza",1)
      subject.add("Pepsi",2)
      expect(subject.order).to eq([{item: "Pizza", num: 1},{item: "Pepsi", num: 2}])
    end
  end
end