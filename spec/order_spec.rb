require 'order'

describe Order do

  let (:order) {described_class.new}
  let (:dish) {double :dish}

  describe "initializing" do
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
    end




  end

end
