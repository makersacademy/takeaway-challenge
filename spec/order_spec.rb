require 'order'

describe Order do

  let(:restaurant_double) {double :restaurant}
  let(:display_double) {double :display}
  let(:order) {Order.new(restaurant_double,display_double)}
  before :each do
    allow(display_double).to receive(:menu) {"1. burger (£10)\n2. pizza (£7)\n3. fish (£12)"}
  end

  context "#initialize" do
    it "creates empty basket array readable from outside" do
      expect(order.basket).to eq []
    end
end

  context "#request_menu" do

    it "returns a string" do
      expect(order.request_menu).to be_a(String)
    end

    it "returns string containing available dishes" do
      expect(order.request_menu).to eq "1. burger (£10)\n2. pizza (£7)\n3. fish (£12)"
    end
  end

  context "#request_item" do
    it "adds selected item to basket" do
      allow(restaurant_double).to receive(:hold_portion_of_requested_dish) {{:burger => 10}}
      order.request_item("burger")
      expect(order.basket).to eq [{:burger => 10}]


    end
  end



end
