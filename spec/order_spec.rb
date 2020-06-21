require 'order'

describe Order do
  describe "#initialize" do
    it "should start with an array" do
      order = ["desert", "dish"]

      new_order = Order.new(order)

      expect(new_order.order).to eql(order)
    end
  end

  # describe "#total" do
  #   it "should calculate the total of the order" do
  #     dish = double("dish", name: "pasta", price: 12.99)
  #     desert = double("dish2", name: "tiramisu", price: 16.99)
  #   end
  # end
end
