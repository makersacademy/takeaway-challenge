require 'takeaway'
require 'pry'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double :order }
  let(:txt_message) { double :txt_message }

  subject {
    described_class.new(menu: menu,
    order: order,
    txt_message: txt_message)
  }

  describe "#menu" do
    it "should display a list of dishes with prices" do
      expect(menu).to receive(:show_menu)
      subject.menu
    end
  end

  describe "#add_to_order" do
    it "should call add method on Order object" do
      expect(order).to receive(:add).with("Half Chicken", 2)
      subject.add_to_order("Half Chicken", 2)
    end

    it "should tell the user what was added to their order" do
      allow(order).to receive(:add).with("Half Chicken", 2)
      expect(subject.add_to_order("Half Chicken", 2)).to eq "Added 2 x Half Chicken to your order"
    end
  end

  describe "#check_total" do
    it "should call check_total method on Order object" do
      expect(order).to receive(:total)
      subject.check_total
    end
  end

  describe "#current_order" do
    it "should call current on Order object" do
      expect(order).to receive(:current)
      subject.current_order
    end
  end

  describe "#place_order" do
    before {
      allow(order).to receive(:add).with("Half Chicken", 2)
      allow(order).to receive(:total).and_return(16)
      subject.add_to_order("Half Chicken", 2)
    }

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
