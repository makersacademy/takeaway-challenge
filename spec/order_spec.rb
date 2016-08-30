require "order"

describe Order do
  let(:menu) {{"margherita" => 8}}
  let(:item) {double :item}
  let(:quantity) {double :quantity}
  let(:order){described_class.new(menu)}

  describe "#add" do
    it "adds items to the order" do
      allow(menu).to recieve(:pizza)
      subject.add(item, quantity)
      expect(subject.basket).to eq(item => quantity)
    end
    it "" do
      expect(subject.add("margherita", 2)).to include(16)
    end
  end
end
