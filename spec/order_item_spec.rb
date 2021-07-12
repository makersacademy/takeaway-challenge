require "order_item"

describe "order_item" do 
    describe "#initialize" do
        it "creates the order_item name equal to nil" do
            order_item = Order_item.new
            expect(order_item.order_name).to eq nil
        end

        it "sets the price for the orde_item to nil" do
            order_item = Order_item.new
            expect(order_item.order_price).to eq nil
        end
    end
end