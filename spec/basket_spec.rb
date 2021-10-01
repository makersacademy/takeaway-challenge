require "basket"

RSpec.describe Basket do
  let(:basket) { Basket.new }
  describe ".add_item" do
    describe "initialize" do
      it "starts with an empty basket" do
        expect(basket.basket).to eq []
      end
    end
    it "adds food to the basket" do
      expect { basket.add_item("D8 - Spider") }.to change { basket.basket.length }.to 1
    end
  end
  describe ".view_basket" do
    it "returns an array of all items in the basket" do
      expect { basket.add_item("D10 - White Tiger Maki") }.to change { basket.basket }.to ["D10 - White Tiger Maki"]
    end
  end
end
