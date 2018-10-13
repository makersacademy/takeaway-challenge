require 'takeaway'
require 'pry'

describe Takeaway do
  let(:txt_message) { double :txt_message }
  subject { described_class.new(txt_message: txt_message) }

  describe "#menu" do
    it "should display a list of dishes with prices" do
      expect(subject.menu).to eq "Quarter Chicken: £4\nHalf Chicken: £8\nWhole Chicken: £13\nChicken Wing: £1"
    end
  end

  describe "#add_to_order" do
    it "should add the dish and quantity to the current order" do
      subject.add_to_order("Half Chicken", 2)
      expect(subject.current_order).to eq "Your current order:\n2 x Half Chicken"
    end

    it "should add several dishes to the current order" do
      subject.add_to_order("Half Chicken", 2)
      subject.add_to_order("Chicken Wing", 5)
      expect(subject.current_order).to eq "Your current order:\n2 x Half Chicken\n5 x Chicken Wing"
    end
  end

  describe "#check_total" do
    it "should return the total cost of the order" do
      subject.add_to_order("Half Chicken", 2)
      subject.add_to_order("Chicken Wing", 5)
      expect(subject.check_total).to eq "£21"
    end
  end

  describe "#place_order" do
    before { subject.add_to_order("Half Chicken", 2) }

    context "incorrect sum" do
      it "should raise an error" do
        expect { subject.place_order(7) }.to raise_error("Incorrect total provided")
      end
    end

    context "correct sum" do
      it "should send a text message to confirm delivery" do
        expect(txt_message).to receive(:send)
        subject.place_order(16)
      end
    end
  end
end
