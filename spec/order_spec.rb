require 'order'

describe Order do

subject(:order) { Order.new(menu) }
let(:menu) { double :menu, get_dish_price: nil }
let(:quantity) { double :quantity }
let(:dish) { double :dish }
let(:cost_per_dish) { double :cost_per_dish }

  describe "#add" do

    it "should create an order and enrich the order with dish price" do
      allow(menu).to receive(:get_dish_price).with(dish).and_return(cost_per_dish)
      order.add(dish, quantity)
      expect(order.basket[0]).to eq [dish,quantity,cost_per_dish]
    end

    it "should print the order when order is placed" do
      expect(order.add(dish, quantity)).to eq ("#{quantity}x #{dish}(s) added to your basket")
    end
  end
end
