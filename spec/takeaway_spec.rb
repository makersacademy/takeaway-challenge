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
    allow(order).to receive(:order) { [{"Noodles" => 2.99,}, {"Chips" => 2.49}, {"Pasta" => 5.99}] }
  end

  it { is_expected.to be_a Takeaway }

  describe "#menu" do

    it "can view the menu as uneditable symbol" do
      expect(subject.menu).to eq menu_symbol
    end
  
  end
  
  describe "#current_order" do
    
    it "can view current order as uneditable symbol" do
      expect(subject.current_order).to eq menu_symbol
    end

  end

  describe "#add" do

    it "responds to method call (logic in Order class)" do
      allow(order).to receive(:add)
      expect(subject).to respond_to(:add).with(1).argument
    end

  end

end
