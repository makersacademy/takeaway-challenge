require "order"

describe Order do
  subject(:order) {described_class.new(Menu)}

  it "should have menu method that displays a list of dishes with prices" do
    expect(order.menu).to eq ({chicken:5, beef:6, pork: 7})
  end
  context "when #add it" do
    it "should take 2 arguments, the dish name and number of portions" do
      expect(order).to respond_to(:add).with(2).arguments
    end
    it "should save the items" do
      expect(order.add("chicken",5)).to eq [["chicken",5]]
    end

    it "should raise an error if the dish is not in the menu" do
      expect{order.add("duck",2)}.to raise_error "The dish is not on the menu."
    end
  end
  context "when #total" do
    it {is_expected.to respond_to :total}
    it "should calculate the cost of all the added dishes" do
      order.add("chicken",5)
      expect(order.total).to eq 25
    end
  end

end
