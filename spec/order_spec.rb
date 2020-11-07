require 'order'

describe Order do
  let(:food1) { double :food, id: 1, item_name: "Soup", item_price: 5 }
  let(:food2) { double :food, id: 2, item_name: "Asparagus", item_price: 2 }
  describe "#add_item" do
    it "adds multiple food items in different quantities" do
      subject.add_item(food1, 5)
      subject.add_item(food2, 3)
      expect(subject.total).to eq(31)
    end
  end

  describe "#to_s" do
    it "prints current order in human readable form" do
      skip
    end
  end
end