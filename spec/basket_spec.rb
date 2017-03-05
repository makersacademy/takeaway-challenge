require 'basket'

describe Basket do
  subject (:basket) {described_class.new([{"Cheese Pizza" => 5.99}])}

  it {is_expected.to respond_to(:add_item)}

  describe "#defaults" do
    it "sets list of available items to the menu passed in" do
      expect(subject.available_items).to eq [{"Cheese Pizza" => 5.99}]
    end
    it "initiates an empty array representing user selections" do
      expect((subject.selected_items).length).to eq 0
    end
    it "sets the total to be 0" do
      expect(subject.total).to eq 0.00
    end
  end

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
