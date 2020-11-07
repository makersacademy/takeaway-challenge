require 'order'

describe Order do

  describe "#initialize" do
    it "has an empty order array" do
      expect(subject.order_record).to eq([])
    end

    it "has a bill of 0" do
      expect(subject.bill).to eq 0
    end
  end

  describe "#add" do
    it "raises an error if person tries to order item not on menu" do
      expect { subject.add("foie gras") }.to raise_error("Dish not on menu")
    end

    it "lets user add items to their order" do
      subject.add("Burger", 1)
      expect(subject.order_record.length).to eq 1
    end

    it "adds items to user's bill" do
      subject.add("Burger", 1)
      expect(subject.bill).to eq 9
    end 
  end

end
