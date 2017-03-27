require 'takeaway'

describe Takeaway do

  let(:menu_class){ double :menu_class, new: menu }
  let(:menu){ double :menu, print: printed_list }
  let(:printed_list){"Spring rolls £3.50, Chicken £4.50"}
  let(:order_class){double :order_class, new: order}
  let(:order){double :order, total: 15}
  let(:sms){double :sms, send: nil}

  subject(:takeaway){described_class.new(menu, config: {}, order_class, sms)}

  before do
    takeaway.begin_order
  end

  describe "#read_menu" do
    it "displays list of dishes with prices" do
      expect(takeaway.read_menu).to eq printed_list
    end
  end

  describe "#begin_order" do
    it "creates a new order" do
      expect(takeaway.order).to eq order
    end
  end

  describe "#add" do
    it "adds items to order" do
      expect(takeaway.order).to receive(:add)
      takeaway.add("Spring rolls", 1)
  end
end

  describe "#place_order" do
    it "raises error if price is incorrect" do
      allow(takeaway).to receive(:add).with(:rolls, 3).and_return(3)
      allow(order).to receive(:total){9.50}
      expect(takeaway.place_order(16)).to raise_error "Price is incorrect"
    end

    it "sends sms confirmation if price is correct" do
      #allow(order).to receive(:total){15}
      subject.place_order(17)
      expect(sms).to have_received(:send)
    end
  end
end
