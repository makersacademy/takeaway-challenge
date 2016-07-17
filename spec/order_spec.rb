require "order"

describe Order do
  let(:item) {double :item}
  let(:quantity) {double :quantity}

  describe "#add" do
    it "adds items to the order" do
      expect(subject.add(item, quantity)).to eq(item => quantity)
      expect(subject.add("margherita", 2)).to include(16)
    end
  end
end
