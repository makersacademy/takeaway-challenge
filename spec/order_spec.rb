require "menu"
require "order"
require "dish"


describe "Order" do 
    describe "#initialize" do
        it "Creates an Order Object with a number" do
            order = Order.new(0)
            expect(order.order_number).to eq 0
        end

        it "Creates an empty array for the Order" do
            order = Order.new(0)
            expect(order.order_list).to eq []
        end
    end

    
end


