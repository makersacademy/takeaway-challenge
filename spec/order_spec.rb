require "order"

describe Order do
  let(:order) { Order.new }
  
  describe "initialize" do
    it "creates an instance of an order" do
      expect(subject).to be_an_instance_of(Order)
    end
    
    it "stores quantities of added dishes in an hash" do
      expect(subject.trolley).to be_an_instance_of(Hash)
    end
    
    it "is empty when creating a new order" do
      expect(subject.trolley).to be_empty
    end
  end
  
  describe "#add_dish" do
    it { is_expected.to respond_to(:add_dish).with(2).arguments }

    it "stores added dishes using dish names and quantities" do
      expect { subject.add_dish("Ramen", 2) }.to change { subject.trolley.length }.by 1
    end
    
    it "adds several dishes" do
      subject.add_dish("Ramen", 2)
      subject.add_dish("Noodles", 3)
      expect(subject.trolley.length).to eq 2
    end
  end
end
