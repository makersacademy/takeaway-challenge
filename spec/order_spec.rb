require 'order'

describe Order do

  let (:order) {described_class.new}
  let (:dish) {double :dish}
  let (:dish2) {double :dish2}

  describe "New instance of Order" do
    it "initialize with an empty array current order" do
      expect(order.current_order).to eq []
    end
  end

  describe "Making an order" do

    describe "Checking what is in the current order" do
      it "current order shows the dishes that have been added to the order" do
        order.add_dish(dish,3)
        expect(order.current_order).to include({dish: dish, quantity: 3})
      end

      it "should raise an error if the quantity entered is not an integer or is zero " do
        expect{order.add_dish(dish,0)}.to raise_error "You must enter an integer that is at least 1"
        expect{order.add_dish(dish,2.3)}.to raise_error "You must enter an integer that is at least 1"
        expect{order.add_dish(dish,"Hello world")}.to raise_error "You must enter an integer that is at least 1"
      end
    end

    describe "calculating the total cost of the order" do

      before do
        allow(dish).to receive(:name).and_return "Chilli Corn Carne"
        allow(dish).to receive(:price).and_return 4.5
        allow(dish2).to receive(:name).and_return "Pad Thai"
        allow(dish2).to receive(:price).and_return 5.5
      end

      it "should return zero if no order is added" do
        expect(order.total_price).to eq 0
      end

      it "should return the total for order with one dish" do
        order.add_dish(dish, 3)
        expect(order.total_price).to eq 13.5
      end

      it "should return a different total if the there is a different dish with the same quantity" do
        order.add_dish(dish2,3)
        expect(order.total_price).to eq 16.5
      end

      it "should return the total for order of more than " do
        order.add_dish(dish,4)
        order.add_dish(dish2, 2)
        expect(order.total_price).to eq 29
      end
    end

  end

end
