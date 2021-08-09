require 'takeaway'

describe Takeaway do

  let(:checker) { double :checker }
  let(:texter) { double :texter }

  menu_hash = {
    "Noodles" => 2.99, 
    "Chips" => 2.49, 
    "Pasta" => 5.99
  }
  
  subject { described_class.new(menu_hash) }
   
  describe "#view_menu" do

    it "can view the menu as immutable symbol" do
      sample_symbol = :"Noodles: 2.99, Chips: 2.49, Pasta: 5.99" 
      expect(subject.view_menu).to eq sample_symbol
    end
  
  end
  
  describe "#check_order" do
    
    it "can view current order as immutable symbol" do
      expect(subject.check_order).to eq(:"Nothing ordered!")
    end

  end

  describe "#add" do

    context "when invalid item entered" do

      it "raises error" do
        expect { subject.add("Chop Suey") }.to raise_error "Item not available"
      end

    end

    context "when valid item entered" do

      before(:each) do
        allow(checker).to receive(:check_total) { |order| order.size }
      end

      it "adds to order (test mocks check_order to extract size of order array)" do
        expect { subject.add("Noodles") }.to change { subject.check_order(checker) }.from(0).to(1)
      end

      it "add several items - (test mocks check_order to extract size of order array)" do
        expect { 2.times { subject.add("Chips") } }.to change { subject.check_order(checker) }.from(0).to(2)
      end

      it "reset order array if item added after order placed (test mocks check_order to extract size of order array)" do
        2.times { subject.add("Noodles") }
        allow(texter).to receive(:sms_send)
        subject.place_order(texter)
        expect { subject.add("Noodles") }.to change { subject.check_order(checker) }.from(2).to(1)
      end

    end   
  end

  describe "#check_order" do

    it "uses CheckTotal logic to return sum & total of order" do
      output = :"Noodles: 2.99 + Chips: 2.49 = 5.48 TOTAL"
      allow(checker).to receive(:check_total) { output }
      expect(subject.check_order(checker)).to eq(output)
    end

  end
  
  describe "#place_order" do

    context "when nothing ordered" do
  
      it "raises error" do
        expect { subject.place_order }.to raise_error "Nothing ordered!"
      end

    end

    context "when items ordered" do

      before(:each) do
        subject.add("Noodles")
      end

      it "raises error if order already placed" do
        allow(texter).to receive(:sms_send)
        subject.place_order(texter)
        expect { subject.place_order(texter) }.to raise_error "Already ordered!"
      end

      it "uses TextMessage logic (mocked here) to send text message" do  
        output = "<A Twilio text message>"
        allow(texter).to receive(:sms_send) { output }
        expect(subject.place_order(texter)).to eq(output)
      end

    end
  end
end
