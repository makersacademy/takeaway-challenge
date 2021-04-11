require "order"

describe Order do
  let(:subject) { Order.new({ "Margherita pizza" => 9, "Can of drink" => 1 }) }
  

  describe "#order_list" do
    it "order_list is initally empty" do
      expect(subject.order_list).to be_empty
    end
  end

  describe "#add_to_order" do
    it "add to order adds 1 dish to order_list" do
      subject.add_to_order("Margherita pizza")
      expect(subject.order_list).to eq({ "Margherita pizza" => 1 })
    end

    it "can add multiple of a dish to order_list" do
      subject.add_to_order("Margherita pizza", 2)
      expect(subject.order_list).to eq({ "Margherita pizza" => 2 })
    end
  end

  describe "#total" do
    it "add to order adds price to total cost of order" do
      expect { subject.add_to_order("Margherita pizza", 2) }.to change { subject.total }.by 18
    end
  end

  describe "#check_total" do
    it "produces a receipt and compares with total" do
      subject.add_to_order("Margherita pizza", 2)
      subject.add_to_order("Can of drink", 3)
      expect(subject.check_total).to eq "You have ordered: 2 x Margherita pizza (£9 each) 3 x Can of drink (£1 each). The total is £21."
    end
  end

  describe "#place_order" do
    before(:each) { allow(subject).to receive(:send_sms).and_return("Text sent") }
    it "place order sends a text with eta" do
      subject.add_to_order("Margherita pizza", 2)
      expect(subject.place_order).to eq("Text sent")
    end
  end
end
