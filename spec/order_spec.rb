require 'order'

describe Order do

  describe "#order_meal" do
    it "lets me select multiple dishes" do
      expect(subject.order_meal("big mac", "fries")).to eq([ "big mac", "fries" ])
    end
    it "gives an error if the item isn't on the menu" do
      expect{subject.order_meal("apple")}.to raise_error "that's not on the menu!"
    end
  end

end