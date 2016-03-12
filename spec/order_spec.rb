require "order"

describe Order do

  describe "#order" do
    it "should add a dish to the basket" do
      subject.add("skinny fries", 2)
      expect(subject.basket).to include("skinny fries" => 2)
    end
  end


end
