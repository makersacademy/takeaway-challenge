require "order"
describe Order do
  let(:dish) { instance_double(Restaurant, :dishes => { 1 => ["Soup", 3.50], 2 => ["Chips", 4] }) }
  describe "#initialize" do
    it "checks that we have a total that is set to 0" do
      order = Order.new
      expect(order.total).to be_empty
    end
  end
  describe "#select_meal" do
    it "checks select_meal functionality" do
      order = Order.new(dish)
      expect(order.select_meal(1)).to eq ([["Soup", 3.50]])
    end
  end
  describe "#total" do
    it "calculates the total of the order" do
      order = Order.new(dish)
      order.select_meal(1)
      order.select_meal(2)
      expect(order.total_order).to eq (7.50)
    end
  end
end
