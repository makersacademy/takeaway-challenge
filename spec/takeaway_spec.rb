require 'takeaway'

describe Takeaway do

  let(:order) { double :order }
  
  subject { described_class.new(order) }
  
  menu_hash = {
    "Noodles" => 2.99, 
    "Chips" => 2.49, 
    "Pasta" => 5.99
  }
      
  before(:each) do
    allow(order).to receive(:inventory) { menu_hash }
    allow(order).to receive(:order) { Array.new }
  end

  it { is_expected.to be_a Takeaway }

  describe "#menu" do

    it "returns the menu hash" do
      expect(subject.menu).to eq menu_hash
    end
  
  end
  
  describe "#current_order" do
    
    it "returns an array" do
      expect(subject.current_order).to be_a Array
    end

  end

  describe "#add" do

    it "responds to method call (logic in Order class)" do
      allow(order).to receive(:add)
      expect(subject).to respond_to(:add).with(1).argument
    end

  end

end
