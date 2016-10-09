require 'order'

describe Order do

  subject (:order) {Order.new}
  let (:restaurant) {Restaurant.new}

  context "add items from menu" do
    it "method add allows you to avoid " do
      expect(order.see_menu).to eq(restaurant.menu)
    end
  end

  context "using the basket" do
    it{expect(order).to respond_to(:add_meal)}
    it{expect(order).to respond_to(:view_basket)}
    it{expect(order).to respond_to(:confirm_order).with(1).argument}

  end

  context "confirming order" do
    let (:basket) {double basket, basket.total = 10}

    it "raises error if wrong amount" do
      expect{order.confirm_order(8)}.to raise_error("wrong amount")
    end

    it "returns confirmation" do
      expect{order.confirm_order(10).to eq("Order sent")}
    end
  end

end
