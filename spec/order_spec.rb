require 'order'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { {"rice" => 1, "pasta" => 1, "bread" => 1,} }

  describe "#select" do

    it "should respond to select with 2 arguments" do
      expect(order).to respond_to(:select).with(2).arguments
    end

    it "should raise error if dish is not on the menu" do
      expect{order.select("chicken", 3)}.to raise_error("Chicken is not on the menu.")
    end

    it "should update order" do
      order.select("rice", 1)
      expect(order.order).to eq({"rice" => 1})
    end

    it "should update total price" do
      order.select("rice", 1)
      expect(order.total_price).to eq(1)
    end
  end

  describe "#confirm" do

    it "should respond to confirm with 1 argument" do
      expect(order).to respond_to(:select).with(2).arguments
    end

  end
end
