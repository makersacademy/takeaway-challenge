require 'order'

describe Order do

  let(:order) { described_class.new }

  context "#initialize" do
    it "order initializes as an emtpy hash" do
      expect(order.order).to be_a Hash
    end
  end

  context "#add_to_order" do
    it "raises an error if the dish is not on the menu" do
      expect { order.add_to_order("Pizza", 3) }.to raise_error("Sorry this dish is not available")
    end

    it "adds a dish to the order" do
      order.add_to_order("Hui Guo Rou", 1)
      expect(order.order).to eq({ "Hui Guo Rou" => 1 })
    end
  end

  context "#total_cost" do
    it "calculates the total cost" do
      order.add_to_order("Hui Guo Rou", 1)
      order.add_to_order("Mapo DouFu", 3)
      expect(order.total_cost).to eq(13.25)
    end
  end
end
