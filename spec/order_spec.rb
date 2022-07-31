require "order"

describe Order do
  let(:item) {double :item, dish: "ham and eggs", price: 6.99}
  describe "#initialize" do
    it "initializes an empty order" do
      expect(subject.items).to eq []
    end
  end

  describe "#add" do
    it "allows user to add item to order" do
      subject.add(item)
      first_item = subject.items[0]
      expect(first_item[:item]).to eq(item)
    end

    it "throws an error when no item" do
      expect {subject.add()}.to raise_error "you must pass an item"
    end

    it "allow users to specify the quantity of said item" do
      subject.add(item,4)
      first_item = subject.items[0]
      expect(first_item[:quantity]).to eq(4)
    end
  end
end