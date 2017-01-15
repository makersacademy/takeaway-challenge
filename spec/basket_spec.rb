require 'basket'

describe Basket do
  subject (:basket) {described_class.new([{"Cheese Pizza" => 5.99}])}

  it {is_expected.to respond_to(:add_item)}

  describe "#add_item" do
    context "when dish is available" do
      it "adds a dish to the basket if selected by the user" do
        basket.add_item(1)
        expect(basket.selected_items).to include({"Cheese Pizza" => 5.99})
      end
    end

    context "when dish is not available" do
      it "raises an error" do
        expect{basket.add_item(25).to raise_error("Cannot select this dish: this dish is not available")}
      end
    end
  end
end
