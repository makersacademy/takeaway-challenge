require "menu"

describe Menu do
  let(:menu) { Menu.new }
  let(:order) { double :order }
  
  describe "initialize" do
    it "creates an instance of a menu" do
      expect(subject).to be_an_instance_of(Menu)
    end
    
    it "stores names and prices of dishes in an hash" do
      expect(subject.dishes).to be_an_instance_of(Hash)
    end
    
    it "is empty when creating a new menu" do
      expect(subject.dishes).to be_empty
    end
  end
  
  describe "#add" do
    it { is_expected.to respond_to(:add).with(2).arguments }

    it "adds dishes using dish names and prices" do
      expect { subject.add("Sushi", 7) }.to change { subject.dishes.length }.by 1
    end
    
    it "adds several dishes" do
      subject.add("Ramen", 9.99)
      subject.add("Noodles", 6)
      expect(subject.dishes.length).to eq 2
    end
  end
  
  describe "#check_out" do
    it { is_expected.to respond_to(:check_out).with(1).argument }
  end
end
