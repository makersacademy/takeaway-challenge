require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:add) { double("dish", 2) }

  describe "#initialize" do
    it "returns an empty hash" do
      expect(order.trolley).to eq({})
    end
    it "returns a new menu" do
      expect(order.menu).not_to eq nil
    end
  end
  describe "#add" do
    it "add items" do
      allow(order).to receive(:add).with(2).and_return(:default)
    end
  end
  describe "#dish_price" do
    before(:each) do
      order.add("paella", 2)
      order.trolley
    end
    it "displays the total price per dish" do
      expect(order.dish_price).not_to be_nil
    end
  end
  describe "#total" do
    before(:each) do
      order.add("paella", 2)
      order.trolley
      order.dish_price
    end
    it "Displays the total amount of menu" do
      expect(order.total).not_to be_nil
    end
  end
end
