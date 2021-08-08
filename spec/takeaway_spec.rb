require 'takeaway'

describe Takeaway do

  menu_hash = {
    "Noodles" => 2.99, 
    "Chips" => 2.49, 
    "Pasta" => 5.99
  }
  
  sample_symbol = :"Noodles: 2.99, Chips: 2.49, Pasta: 5.99" 

  subject { described_class.new(menu_hash) }
   
  describe "#view_menu" do

    it "can view the menu as immutable symbol" do
      expect(subject.view_menu).to eq sample_symbol
    end
  
  end
  
  describe "#current_order" do
    
    it "can view current order as immutable symbol" do
      expect(subject.current_order).to eq(:"")
    end

  end

  describe "#add" do

    it "adds a valid dish to order" do
      subject.add("Noodles")
      expect(subject.current_order).to eq(:"Noodles: 2.99")
    end

    it "raises error if user enters unavailable item" do
      expect { subject.add("Chop Suey") }.to raise_error "Item not available"
    end

    it "can add multiple items" do
      2.times { subject.add("Chips") }
      expect(subject.current_order).to eq(:"Chips: 2.49, Chips: 2.49")
    end

    # sets order_placed to false

  end

  describe "#check_total" do

    it "uses CheckTotal logic to return sum & total of order" do
      checker = double
      output = :"Noodles: 2.99 + Chips: 2.49 = 5.48 TOTAL"
      allow(checker).to receive(:check_total) { output }
      expect(subject.check_total(checker)).to eq(output)
    end

    # adds order placed message if called when order_placed = true
  
  end
  
  describe "#place_order" do
  
    it "raises error if no items ordered" do
      expect { subject.place_order }.to raise_error "Nothing ordered!"
    end

    it "uses TextMessage logic (mocked here) to send text message" do  
      texter = double
      subject.add("Noodles")
      output = "<A Twilio text message>"
      allow(texter).to receive(:sms_send) { output }
      expect(subject.place_order(texter)).to eq(output)
    end

    # changes order_placed to true if items ordered

    # raises error if called again while order_placed = true

  end
  
end
