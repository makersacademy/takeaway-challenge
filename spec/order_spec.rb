require "order"

describe Order do
  let(:menu) { { "Espresso": 2 } }
  subject { described_class.new(menu) }

  describe "#update_basket" do
    it "should add items to the basket" do
      expect do
        subject.update_basket("Espresso", 4)
      end.to change { subject.basket.count }.by(4)
    end

    it "should raise an error if item doesn't exist in the menu" do
      expect do
        subject.update_basket("Tap Water")
      end.to raise_error { "Item not found" }
    end
  end

  describe "#calculate_total" do
    it "should have a total of zilch if the basket is empty" do
      expect(subject.calculate_total).to eq(0)
    end

    it "should calculate the total price of the basket" do
      subject.update_basket("Espresso", 4)
      expect(subject.calculate_total).to eq 8
    end
  end
end
