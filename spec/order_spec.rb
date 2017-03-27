require 'order'

describe Order do
  subject(:order) { described_class = Order.new }
  let (:payment) { double :payment }

  describe "#initialize" do
    it "So that I can order the meal I want, initialize order with empty basket" do
      expect(order.basket).to eq ""
    end

    it "So that I can order the meal I want, initialize order with 0 balance" do
      expect(order.total).to eq 0
      end
    end

    describe "#add_items" do
      it "So that I can order the meal I want, checks if meal is available on the menu" do
        expect{order.add_items("Curry", 3)}.to raise_error "Curry is not available on this menu."
      end
    end

    describe "#basket" do
      it "So that I can order the meal I want, checks order is added to the basket" do
        order.add_items("Pizza", 4)
        expect(order.basket).to eq "4x Pizza(s), Unit price: 8.0, Total price: 32.0"
      end
    end

    describe "#total" do
    it "So that I can order the meal I want, checks customers are charged correct amount" do
      expect{order.add_items("Pizza", 4)}.to change {order.total}.by 32.00
      end
    end

    describe "#payment" do
      it "So that I can verify customer payment, raise error if incorrect amount" do
        order.add_items("Pizza", 3)
        expect{order.payment(20.0)}.to raise_error "Incorrect payment amount: Total amount is: £24.0"
      end

      it "So that I can verify customer payment, check that total is 0 when payment complete" do
        order.add_items("Pizza", 3)
        allow(order).to receive(:confirmation) {false}
        order.payment(24.0)
        expect(order.total).to eq 0
      end
    end
  end
