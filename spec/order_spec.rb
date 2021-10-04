require "order"
describe Order do
  let(:dish) { instance_double(Restaurant, :dishes => { 1 => ["Soup", 3.50], 2 => ["Chips", 4] }) }
  let(:order) { Order.new(dish) }
  describe "#select_meal" do
    it "checks select_meal functionality" do
      allow(dish).to receive(:available?).and_return(true)
      expect(order.select_meal(1)).to eq ([["Soup", 3.50]])
    end
    it "throws error if meal that is selected is not available" do
      allow(dish).to receive(:available?)
      expect { order.select_meal(3) }.to raise_error("Meal does not exist, sorry!")
    end
  end
  describe "#total" do
    it "calculates the total of the order" do
      allow(dish).to receive(:available?).and_return(true)
      order.select_meal(1)
      order.select_meal(2)
      expect(order.total_order).to eq (7.50)
    end
  end
  describe "#confirm" do
    it "changes the send_order variable to true" do
      expect(order.confirm).to eq true
    end
  end
end
