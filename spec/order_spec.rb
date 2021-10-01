require "order"
describe Order do
  describe "#initialize" do
    it "checks that we have a total that is set to 0" do
      order = Order.new
      expect(order.total).to equal (0)
    end
  end
  describe "#select_meal" do
    let(:dish) { instance_double(Restaurant, :dishes => { 1 => ["Soup", "£3.50"], 2 => ["Chips", "£4"] }) }
    it "checks select_meal functionality" do
      order = Order.new(dish)
      order.select_meal(1)
      expect(order.select_meal(1)).to eq (["Soup", "£3.50"])
    end
  end
end
