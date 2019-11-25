require "order"

describe Order do 
  describe "#add_item" do
    it "should add an item to the order array" do
      subject.add_item("Pizza")
      expect(subject.order).to eq(["Pizza"])
    end
  end
end
