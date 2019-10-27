require 'order'

describe Order do

  let(:restaurant_double) {double :restaurant}
  let(:display_double) {double :display}
  let(:order) {Order.new(restaurant_double,display_double)}
  before :each do
    allow(display_double).to receive(:menu)
    allow(display_double).to receive(:basket)
  end

  context "#initialize" do
    it "creates empty basket array readable from outside" do
      expect(order.basket).to eq []
    end
end

  context "#request_menu" do

  it "returns nil" do
      expect(order.request_menu).to eq nil
    end
  end

  context "view_basket" do

    it "returns nil" do
        expect(order.view_basket).to eq nil

    end

  end

  context "#request_item" do
    it "adds selected item to basket" do
      allow(restaurant_double).to receive(:hold_portion_of_requested_dish) {{:burger => 10}}
      order.request_item("burger")
      expect(order.basket).to eq [{:burger => 10}]
    end
  end

  context "#basket_total_price" do
    it "calculates the sum of everything in basket" do
      allow(restaurant_double).to receive(:hold_portion_of_requested_dish) {{:burger => 10}}
      order.request_item("burger")
      allow(restaurant_double).to receive(:hold_portion_of_requested_dish) {{:pizza => 12}}
      order.request_item("pizza")
      expect(order.basket_total_price).to eq 22
    end
  end




end
