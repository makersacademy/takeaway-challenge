require 'basket'

describe Basket do
  subject (:basket) {described_class.new([{"Cheese Pizza" => 5.99}])}

  it {is_expected.to respond_to(:add_item)}

  describe "#add_item" do
    context "when dish is available" do
      it "adds a dish to the basket if selected by the user" do
        basket.add_item("Cheese Pizza", 1)
        expect(basket.selected_items).to include({"Cheese Pizza" => 5.99})
      end

      it "adds dishes to basket when quantity is specified by user" do
        basket.add_item("Cheese Pizza", 3)
        expect(basket.selected_items.length).to eq 3
      end

      it "updates the total when a dish is selected by the user" do
        basket.add_item("Cheese Pizza", 1)
        expect(basket.total).to eq 5.99
      end
    end
  end
end
