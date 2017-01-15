require 'basket'

describe Basket do

  describe "#add" do
    it "adds to basket" do
      subject.add("i1",2)
      subject.add("i2",4)
      subject.add("i1",3)
      expect(subject.items).to eq({"i1"=>5,"i2"=>4})
    end
  end

  describe "#remove" do
    it "raises error if not in basket" do
      subject.add("i1",3)
      subject.add("i2",4)
      msg = "Item is not in basket"
      expect { subject.remove("i3",2) }.to raise_error(msg)
    end
    it "removes specified number of items from basket" do
      subject.add("i1",3)
      subject.add("i2",4)
      subject.remove("i1",2)
      expect(subject.items).to eq({"i1"=>1,"i2"=>4})
    end
  end

  describe "#has?" do
    it "confirms if item is in basket" do
      subject.add("i1",3)
      expect(subject.has?("i1")).to eq true
    end
    it "says if item is not in basket" do
      subject.add("i1",3)
      expect(subject.has?("i2")).to eq false
    end
  end

end
