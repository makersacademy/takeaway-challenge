require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:add) {double"add" }

  describe "#initialize" do
    it "returns an empty hash" do
      expect(order.trolley).to eq({})
    end
    it "returns a new menu" do
      expect(order.menu).not_to eq nil
    end
  end

  describe "add" do
    context "When items are added into the trolley" do
      it {is_expected.to respond_to(:add).with(2).arguments}
      it "add items"do
        expect(order.add(dish,quantity)).to eq("Thank you. Your #{dish} dish was added #{quantity} times in your trolley")
      end
    end
  end

end
