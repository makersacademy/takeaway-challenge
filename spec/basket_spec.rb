require 'basket'

describe Basket do

  subject(:basket) { described_class.new }

  describe "#update" do
    it "adds the dish and quantity to the basket" do
      expect(basket.update("burger", 2)).to eq [{ name: "burger", quantity: 2 }]
    end
  end

  describe "#subtotal" do
    it "totals the items in the basket" do
      basket.update_subtotal("burger", 2)
      basket.update_subtotal("fries", 3)
      expect(basket.subtotal).to eq(32)
    end
  end

  describe "#print" do
    it "displays the current basket" do
      basket.update("burger", 2)
      basket.update("fries", 3)
      expect { basket.print }.to output { "2 x burger @ 10.0: 20.0\n 3 x fries @ 4.0: 12.0" }.to_stdout
    end

    it "returns the basket subtotal" do
      basket.update_subtotal("burger", 2)
      basket.update_subtotal("fries", 3)
      expect(basket.print).to eq(32)
    end
  end

end
