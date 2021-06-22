require "takeaway"

describe Takeaway do 
  subject(:takeaway){Takeaway.new}

  describe "initialize" do

    it "creates an instance of an order" do
      expect(subject).to be_an_instance_of(Takeaway)
    end

    it "stores quantities of added dishes in an hash" do
      expect(subject.finished_order).to be_an_instance_of(Hash)
    end

    it "is empty when creating a new order" do
      expect(subject.finished_order).to be_empty
    end
  end

  describe "#add_to_order" do

    it { is_expected.to respond_to(:add_to_order).with(2).arguments }

    it "stores added dishes using dish names and quantities" do
      expect { subject.add_to_order("Burger", 4) }.to change { subject.finished_order.length }.by(1)
    end

    it "adds several dishes" do
      subject.add_to_order("Burger", 4)
      subject.add_to_order("Pizza", 6)
      expect(subject.finished_order.length).to eq(2)
    end
  end
end