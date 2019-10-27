require 'order'

describe Order do

  let(:restaurant_double) {double :restaurant}
  let(:display_double) {double :display}
  let(:order) {Order.new(restaurant_double,display_double)}
  let(:restaurant) { Restaurant.new }
  before :each do
    allow(display_double).to receive(:menu)
    allow(display_double).to receive(:basket)
    restaurant.create_dish("burger", 10)
    restaurant.create_dish("pizza", 9)

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



  context "#cancle_order" do
    it "iterates through basket and adds portions back to dishes" do
      order = Order.new(restaurant)
      order.request_item("burger")
      expect{order.cancle_order}.to change{ restaurant.dishes[0].remaining_portions }.by 1
    end

    it "emptys basket" do
      order = Order.new(restaurant)
      order.request_item("burger")
      order.cancle_order
      expect(order.basket).to eq []
    end
  end

  context "#checkout" do
    it "tells restaurant to take dishes that have run out off the menu" do
      order = Order.new(restaurant)
      allow(order).to receive(:gets) {50}
      5.times { order.request_item("burger") }
      expect{order.checkout}.to change{ restaurant.dishes.count }.by -1
    end

    it "#emptys basket" do
      order = Order.new(restaurant)
      order.request_item("burger")
      allow(order).to receive(:gets) {10}
      order.checkout
      expect(order.basket).to eq []
    end

    it "raise error if customer does not pay the right amount" do
      order = Order.new(restaurant)
      order.request_item("burger")
      allow(order).to receive(:gets) {9}
      expect { order.checkout }.to raise_error "Incorrect Payment Amount"
    end
  end

end
