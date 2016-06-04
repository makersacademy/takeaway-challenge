require "order"

describe Order do
  describe "#add_item" do
    it "should add items to an order" do
      expect do
        subject.add_item('Espresso', 4)
      end.to change { subject.shopping_basket.count }.by(4)
    end
  end

  describe "#calculate_total" do
    it "should raise an error if the basket is empty" do
      expect do
        subject.calculate_total
      end.to raise_error { "Empty Basket" }
    end

    it "should calculate the total price of the basket" do
      subject.add_item('Espresso', 4)
      expect(subject.calculate_total).to eq 8
    end
  end

  describe "#reset_order" do
    it "clears out the shopping basket" do
      subject.add_item('Espresso', 4)
      subject.reset_order
      expect(subject.shopping_basket).to be_empty
    end
  end
end
