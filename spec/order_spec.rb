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

  describe "#calculate_total" do
    it "gives me a total for my order" do
      order = Order.new
      order.order_meal("fries")
      expect(order.calculate_total).to eq 0.7
    end
  end

end