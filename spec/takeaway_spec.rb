require 'takeaway'

describe Takeaway do

  let(:order) { double :order }
  
  subject { described_class.new(order) }
  
  menu_hash = {
    "Noodles" => 2.99, 
    "Chips" => 2.49, 
    "Pasta" => 5.99
  }

  menu_symbol = :"Noodles: 2.99, Chips: 2.49, Pasta: 5.99" 
      
  before(:each) do
    allow(order).to receive(:inventory) { menu_hash }
    allow(order).to receive(:order) { [{ "Noodles" => 2.99 }, { "Chips" => 2.49 }, { "Pasta" => 5.99 }] }
  end

  it { is_expected.to be_a Takeaway }

  describe "#menu" do

    it "can view the menu as immutable symbol" do
      expect(subject.menu).to eq menu_symbol
    end
  
  end
  
  describe "#current_order" do
    
    it "can view current order as immutable symbol" do
      expect(subject.current_order).to eq menu_symbol
    end

  end

  describe "#add" do

    it "adds a dish to order (logic in Order class)" do
      dish = double
      allow(order).to receive(:add).with(dish) { [{ "Hot Dog" => 4.49 }] }
      expect(subject.add(dish)).to eq([{ "Hot Dog" => 4.49 }])
    end

  end

  describe "#check_total" do

    it "uses CheckTotal logic (mocked here) to return sum & total of order" do
      checker = double
      output = :"Noodles: 2.99 + Chips: 2.49 = 5.48 TOTAL"
      allow(checker).to receive(:check_total) { output }
      expect(subject.check_total(checker)). to eq output
    end

  end

  describe "#place_order" do

    it "uses TextMessage logic (mocked here) to send text message" do  
      texter = double
      output = "<A Twilio text message>"
      allow(texter).to receive(:sms_send) { output }
      expect(subject.place_order(texter)).to eq output
    end

  end

end
