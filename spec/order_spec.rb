require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:add) {double("dish",2)}
  let(:dish_price) {double "dish_price"}

  describe "#initialize" do
    it "returns an empty hash" do
      expect(order.trolley).to eq({})
    end
    it "returns a new menu" do
      expect(order.menu).not_to eq nil
    end
  end
  describe "add" do
      it "add items"do
        allow(order).to receive(:add).with(2).and_return(:default)
      end
  end
  describe "dish_price" do
    it "displays the total price per dish" do
      order.add("paella",2)
      allow(order).to receive(:dish_price).and_return("dish")
      expect(order.dish_price).to eq("dish")
    end
  end
end
