require 'takeaway'
require 'timecop'

describe TakeAway do
  let(:menu) { double(:menu) }
  before(:each) do
    allow(menu).to receive(:dishes).and_return("chilli squid" => 3.95, "pork wonton" => 2.95)
  end

  it "can add a menu" do
    expect(subject.add_menu(menu)).to eq(menu.dishes)
  end

  describe "#place_order" do
    before(:each) do
      subject.add_menu(menu)
    end

    it "adds item to order hash" do
      subject.place_order("chilli squid" => 1)
      expect(subject.order).to include("chilli squid")
    end

    it "adds correct quantity of item to order" do
        subject.place_order("chilli squid" => 3)
        expect(subject.order["chilli squid"]).to eq(3)
      end

    it "calculates cost per item correctly" do
      subject.place_order("chilli squid" => 3)
      expect(subject.total_cost_per_item("chilli squid", 3)).to eq(1185)
    end

    it "raises error if item is not on the menu" do
      expect { subject.place_order("chilli prawns" => 1) }.to raise_error "Chilli prawns is not on the menu."
    end

    it "adds multiple items to order" do
      subject.place_order("chilli squid" => 3, "pork wonton" => 2)
      expect(subject.order.count).to eq(2)
    end

    describe "#delete_from_order" do
      before(:each) do
        allow(menu.dishes).to receive(:[]).with("chilli squid").and_return(3.95)
        subject.place_order("chilli squid" => 1)
      end

      it "deletes item from order" do
        subject.delete_from_order("chilli squid", 1)
        expect(subject.order).to be_empty
      end

      it "knows about banans" do
        expect(subject.send(:bananas)).to eq "bananas"
      end
    end

    describe "#show_order" do
      it "displays the current order" do
        allow(menu.dishes).to receive(:[]).with("chilli squid").and_return(3.95)
        subject.place_order("chilli squid" => 1)
        order = "chilli squid x 1: £3.95, Total: £3.95"
        expect(subject.show_order).to eq(order)
      end
    end

    describe "#grand_total" do
      it "gives the total cost for the order" do
        subject.place_order("chilli squid" => 3, "pork wonton" => 2)
        expect(subject.grand_total).to eq("17.75")
      end
    end

    describe "#confirm_order" do
      before(:each) do
        allow(menu.dishes).to receive(:[]).with("chilli squid").and_return(3.95)
        subject.place_order("chilli squid" => 1)
      end

      it "returns string if confirmation is No" do
        allow(subject).to receive(:gets).and_return("N")
        expect(subject.confirm_order(+441123456789)).to eq("Please edit your order.")
      end

      it "sends text if confirmation is Yes" do
        allow(subject).to receive(:gets).and_return("Y")
        Timecop.freeze(Time.now)
        expect(subject).to receive(:send_message).with(Time.new + 3600, +441123456789)
        subject.confirm_order(+441123456789)
      end
    end
  end
end