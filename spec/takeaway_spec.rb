require "takeaway"
describe Takeaway do
  let (:subject) { Takeaway.new(double :text) }
  describe "#menu" do
    it { is_expected.to respond_to(:menu)}
    it "displays menu items and prices" do
      our_menu = { "pizza" => 5.95, "pasta" => 6.45, "curry" => 6.95, "toast" => 0.1, "fajitas" => 6.45, "bacon sandwich" => 3.50, "steak and chips" => 10.95 }
      expect(subject.menu).to eq our_menu 
    end
  end
  describe "#place_order" do
    context "minimum arguments test" do
      it { is_expected.to respond_to(:place_order).with(2).argument}
    end
    context "non-minimum arguments test" do
      it { is_expected.to respond_to(:place_order).with(4).argument}
    end
    context "other ordering tests" do
      it "places order of dishes" do
        subject.place_order("pizza", "pasta", 12.40)
        expect(subject.order).to eq ["pizza", "pasta"]
      end
      it "doesn't accept orders of items not on the menu" do 
        expect { subject.place_order("grilled baby", "toast", "steak and chips", 15.00) }.to raise_error "Apologies, we do not have grilled baby on the menu."
      end
      it { is_expected.to respond_to(:same_price?) }
      it "takes a customers price and compares to what it should be" do
        subject.place_order("pizza", "pasta", "curry", 19.35)
        expect(subject).to be_same_price
      end
      it "raises error if price entered is not the same as the order total" do
        expect { subject.place_order("pizza", "pasta", "curry", 1) }.to raise_error "Your order costs £19.35 not £1.00"
      end
      let (:text) { spy :text }
      let (:subject) { Takeaway.new(text) }
      it "sends a message to the Text class to send a text" do
        subject.place_order("pizza", "pasta", 12.40)
        expect(text).to have_received(:send_text)
      end
    end
  end
end