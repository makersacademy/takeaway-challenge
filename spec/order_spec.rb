require "order"
describe Order do
  subject(:order) {described_class.new}
  let(:dish) {double(:dish)}
  describe "when a customer starts and order" do
    it "should have no order items" do
      expect(order.items.count).to eq 0
    end

    it "should be able to add an item to the order" do
      order.add_item(dish, 5)
      expect(order.items.count).to eq 1
    end

    it "should be able to calculate the total" do
      expect(order).to respond_to(:order_total)
    end
  end
end
