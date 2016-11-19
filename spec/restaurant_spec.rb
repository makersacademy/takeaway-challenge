require "restaurant"

describe Restaurant do
  subject(:restaurant) {described_class.new}
  let(:dish) {double(:dish)}
  let(:order) {double(:order)}

  describe "when instantiated" do
    it "should have a default name" do
      expect(restaurant.name).to eq Restaurant::DEFAULT_NAME
    end

    it "should start with a menu" do
      expect(restaurant.menu).not_to be_nil
    end

    it "should start with no order" do
      expect(restaurant.order).to be_nil
    end
  end

  describe "when managing orders" do
    it "should be able to start an order" do
      restaurant.start_order
      expect(restaurant.order).not_to be_nil
    end

    it "should be able to finish an order" do
      restaurant.finish_order(order)
      expect(restaurant.orders.count).to eq 1
    end

    it "resets the current order" do
      restaurant.start_order
      restaurant.reset_order
      expect(restaurant.order).to be_nil
    end
  end

end
