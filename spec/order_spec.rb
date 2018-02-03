require 'order'

describe Order do

  let(:order) { described_class. new }

  context "when initialized" do
    it "contains an empty basket hash" do
      expect(order.basket).to eq(Hash.new)
    end
  end

  describe "#add" do
    it 'adds selected dishes and quantities to the basket' do
      order.add("Prawn Gyoza", 2)
      order.add("Chicken Gyoza", 3)
      hash = { "Prawn Gyoza" => 2, "Chicken Gyoza" => 3 }
      expect(order.basket).to eq(hash)
    end

    it 'raises an error when a dish not on the menu is added to the basket' do
      error_message = "This dish is not on the menu"
      expect { order.add("Chips", 3) }.to raise_error(error_message)
    end
  end
end
