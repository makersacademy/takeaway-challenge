require './docs/checkout.rb'

describe Checkout do

let (:checkout) { described_class.new }

  describe "#initialize" do
    it "starts with an empty basket" do
      expect(checkout.checkout_basket).to eq({})
    end
  end

  describe "#save_order" do
    it "saves the order to the checkout basket" do
      allow(checkout).to receive(:save_order).and_return("gyoza", 1)
      expect(checkout.checkout_basket).to include {"gyoza"}
    end
  end

  describe "#calculate_total" do
    it "should calculate the total of the order" do
      checkout.save_order("gyoza", 1)
      expect(checkout.calculate_total).to eq (6.0)
    end
  end

end
