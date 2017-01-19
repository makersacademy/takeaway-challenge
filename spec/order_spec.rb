require 'order'

describe Order do

subject(:order) { Order.new(menu) }
let(:menu) { double :menu }
let(:quantity) { double :quantity }
let(:dish) { double :dish }
let(:cost_per_dish) { double :cost_per_dish }

  describe "#add" do
    context "when order placed correctly" do

      it "should create an order and put it in the basket" do
        allow(subject).to receive(:invalid_order).with(dish).and_return(false)
        allow(subject).to receive(:calc_cost_per_dish).with(dish, quantity).and_return(cost_per_dish)
        order.add(dish, quantity)
        expect(order.basket[0]).to eq order.placed_order
      end

      it "should calculate the cost per dish before placing in basket" do
        allow(subject).to receive(:invalid_order).with(dish).and_return(false)
        allow(menu).to receive(:get_dish_price).with(dish).and_return(5)
        order.add(dish,3)
        expect(order.placed_order[2]).to eq 1500
      end

      it "should print the order when order is placed" do
        allow(subject).to receive(:invalid_order).with(dish).and_return(false)
        allow(subject).to receive(:calc_cost_per_dish).with(dish, quantity).and_return(cost_per_dish)
        order.add(dish, quantity)
        expect(order.add(dish, quantity)).to eq ("#{quantity}x #{dish}(s) added to your basket")
      end

    end

    context "when order placed incorrectly" do
      it "should raise an error" do
        expect {subject.add(:garbage, quantity)}.to raise_error "Invalid order"
      end
    end
  end

end
