require 'basket'

describe Basket do

  subject(:basket) { described_class.new(menu) }
  let(:menu) { double :menu }

  describe "#update" do
    it "adds the dish and quantity to the basket" do
      expect(basket.update("burger", 2)).to eq [{ name: "burger", quantity: 2 }]
    end
  end

  describe "#update_subtotal" do
    it "totals the items in the basket" do
      allow(menu).to receive(:dish_price).with("burger").and_return(10)
      expect { basket.update_subtotal("burger", 2) }.to change { basket.subtotal }.by(20)
    end
  end

  describe "#print" do
    it "displays the current basket" do
      basket.update("burger", 2)
      basket.update("fries", 3)
      allow(menu).to receive(:dish_price).with("burger").and_return(10)
      allow(menu).to receive(:dish_price).with("fries").and_return(4)
      expect { basket.print }.to output { "2 x burger @ 10.0: 20.0\n 3 x fries @ 4.0: 12.0" }.to_stdout
    end

    it "returns the basket subtotal" do
      allow(menu).to receive(:dish_price).with("burger").and_return(10)
      expect { basket.update_subtotal("burger", 2) }.to change { basket.print }.by(20)
    end
  end

end
