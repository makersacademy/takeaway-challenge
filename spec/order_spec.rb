require 'order'

describe Order do
  describe "#order" do
    it "should start out empty" do
      expect(subject.order).to be_empty
    end
  end
  describe "#add" do
    it "should add an item to an order" do
      subject.add("Pizza",1)
      expect(subject.order.last).to eq({item: "Pizza", num: 1})
    end
    it "should add multiple items to an order" do
      subject.add("Pizza",1)
      subject.add("Pepsi",2)
      expect(subject.order).to eq([{item: "Pizza", num: 1},{item: "Pepsi", num: 2}])
    end
  end
  describe "#check" do
    it "should show a message if totals match" do
      subject.add("Pepsi",1)
      expect{ subject.check(1) }.to output("Our totals match.\n").to_stdout
    end
    it "should an error if totals don't match" do
      subject.add("Pepsi",1)
      expect{ subject.check(2) }.to raise_error "Your total does not match ours."
    end
  end
end