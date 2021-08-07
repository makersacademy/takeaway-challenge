require 'takeaway'

describe Takeaway do

  let(:dishes) { double :dishes }
  
  subject { described_class.new(dishes) }
  
  menu_hash = {
    "Noodles" => 2.99, 
    "Chips" => 2.49, 
    "Pasta" => 5.99
  }
      
  before(:each) do
    allow(dishes).to receive(:menu) { menu_hash }
  end

  it { is_expected.to be_a Takeaway }

  describe "#menu" do

    it "returns the menu hash" do
      expect(subject.menu).to eq menu_hash
    end

  end

end
