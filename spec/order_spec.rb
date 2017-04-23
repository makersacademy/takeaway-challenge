require "order"

describe Order do

  let(:takeaway) { Takeaway.new }

  describe "#creates a dish order" do

    it "sets up a new order" do
      expect(subject).to be_an_instance_of(Order)
    end

    it "contains a list to store an item" do
      expect(subject.items).to eq []
      expect(subject.total).to include "total"
    end
  end

  describe "#adds a dish from the menu to the order" do

    it "can add a dish" do
      expect(subject).to respond_to(:add).with(1).argument
    end

    it "fails item not on menu" do
      expect { subject.add(:pad_thai) }.to raise_error "Item not on menu"
    end

    it "adds item to order" do
      subject.add(:chicken_naga)
      expect(subject.items).to include :chicken_naga
    end

  end


end
