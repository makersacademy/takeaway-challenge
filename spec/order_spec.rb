require 'order'

describe Order do

  let(:order) { described_class. new }

  context "when initialized" do
    it "contains an empty basket hash" do
      expect(order.basket).to eq(Hash.new)
    end
  end

  describe "#add" do
    before(:each) do
      order.add("Prawn Gyoza", 2)
      order.add("Chicken Gyoza", 3)
    end

    it "adds selected dishes and quantities to the basket" do
      hash = { "Prawn Gyoza" => 2, "Chicken Gyoza" => 3 }
      expect(order.basket).to eq(hash)
    end

    it "raises an error when a dish not on the menu is added to the basket" do
      error_message = "This dish is not on the menu"
      expect { order.add("Chips", 3) }.to raise_error(error_message)
    end
  end

  describe "#sub-total" do
    before(:each) do
      order.add("Prawn Gyoza", 2)
      order.add("Chicken Gyoza", 3)
    end

    it "calculates the sub-total for each dish" do
      sub_total = "Prawn Gyoza x2 = £7.02, Chicken Gyoza x3 = £9.33"
      expect(order.sub_total).to eq sub_total
    end
  end
<<<<<<< HEAD

  describe '#total' do
    before(:each) do
      order.add("Prawn Gyoza", 2)
      order.add("Chicken Gyoza", 3)
    end

    it "calculates the overall total" do
      expect(order.total).to eq  "Total cost: £16.35"
    end
  end
=======
>>>>>>> 86cbab49a94d3148e78cc18e49ca0c969962d152
end
