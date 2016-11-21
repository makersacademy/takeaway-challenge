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

  describe "when checking order status" do
    it "should return en error when there is no order" do
      expect{restaurant.order_status}.to raise_error("No order has been placed")
    end
  end

  describe "when managing orders" do
    before(:each) {restaurant.add_dish("name")}

    before do
    allow(restaurant).to receive(:send_confirmation)
    allow(restaurant).to receive(:order_status)
    end

    it "should be able to start an order" do
      restaurant.add_to_order(1)
      expect(restaurant.order).not_to be_nil
    end

    it "should be able to finish an order" do
      restaurant.add_to_order(1)
      restaurant.finish_order("")
      expect(restaurant.orders.count).to eq 1
    end

    it "resets the current order" do
      restaurant.add_to_order(1)
      restaurant.reset_order
      expect(restaurant.order).to be_nil
    end

    it "should be able to give an order status" do
      expect(restaurant).to respond_to(:order_status)
    end

    it "should be able to show the menu" do
      expect(restaurant).to respond_to(:show_menu)
    end
  end

end
