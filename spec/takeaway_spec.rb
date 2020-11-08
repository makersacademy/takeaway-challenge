require 'takeaway'

describe Takeaway do

  it "returns a menu when requested" do
    expect(subject).to respond_to(:read_menu)
  end

  it "returns the full menu when requested" do
    expect(subject.menu.dishes.length).to eq 5
  end

  describe "#order" do

    it "responds to order" do
      expect(subject).to respond_to(:order).with(2).arguments
    end

    it "adds an order to the basket" do
      subject.order("pizza")
      expect(subject.basket.length).to eq 1
    end
  end
end
