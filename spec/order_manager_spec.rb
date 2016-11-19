require 'order_manager'

describe OrderManager do

  let ( :order_manager) {described_class.new}
  let (:order) {double :order}

    describe "Submitting an order" do

      it "should submit an order" do
        order_manager.submit_order(order)
        expect(order_manager.order).to eq order
      end

    end

end
