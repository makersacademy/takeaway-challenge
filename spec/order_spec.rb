require 'order'

describe Order do



let(:order) {Order.new}
let(:order_item_double) {double(:dish_id => 1, :quantity=>2, :sub_total=>9 )}
    describe "List of menu items" do
        it "Show list of menu items when calling order method" do
        expect(order).to respond_to(:display_menu)
        end
    end

    describe "#add" do

        it "Add one item to the dishes ordered" do
        expect{order.add(5, 2)}.to change{order.dishes_ordered.length}.by(1) 
        end
        
        it "Add item which is not in menu" do
            expect{order.add(6, 1)}.to raise_error("Dish doesn't exist")
        end
    end    
end