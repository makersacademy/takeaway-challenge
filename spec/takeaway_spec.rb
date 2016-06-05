require "takeaway"
require "order"

describe Takeaway do
  let(:menu) { double(:menu) }
  let(:order) { instance_double(Order) }
  subject { described_class.new(order) }

  describe "#menu" do
    before do
      allow(subject).to receive(:menu).and_return(menu)
    end

    it "should be able to access the menu" do
      expect(subject.menu).to eq(menu)
    end
  end

  describe "#total" do
    before do
      allow(order).to receive(:calculate_total).and_return(10)
    end

    it "should return a number as the basket total price" do
      expect(subject.total).to be_integer
    end
  end

  context "when basket is empty" do
    describe "#checkout" do
      before do
        allow(subject).to receive(:empty?).and_return(true)
      end

      it "should raise an error if there's nothing to check out" do
        expect do
          subject.checkout
        end.to raise_error("Nothing to check out!")
      end
    end
  end

  context "when basket is not empty" do
    before do
      allow(order).to receive(:basket).and_return(["Espresso", "Espresso"])
    end

    describe "#basket" do
      it "should be able to hold an iterable list of items" do
        expect(subject.basket).to respond_to(:each)
      end
    end

    describe "#add_to_basket" do
      before do
        allow(order).to receive(:update_basket)
      end

      it "should return the basket items" do
        subject.add_to_basket("Espresso", 2)
        expect(subject.basket).to eq(["Espresso", "Espresso"])
      end
    end

    describe "#checkout" do
      before do
        allow(order).to receive(:calculate_total).and_return(0)
        allow(subject).to receive(:empty?).and_return(false)
      end

      it "should reset the order by clearing the basket" do
        subject.checkout
        expect(subject.basket).to eq([])
      end
    end
  end
end
