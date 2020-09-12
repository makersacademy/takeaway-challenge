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

    describe "#place_order" do
        it "Placing order succesfully when subtotal and total are equal" do
            order.add(1,2)
            order.add(4,1)
            expect{order.place_order}.not_to raise_error
        end

        it "Raise error when subtotal and total are not equal" do
            order.add(3,3)
            #order.instance_variable_set(:@total, 5)
            allow(order).to receive(:get_total).and_return(2)
            expect{order.place_order}.to raise_error("Total is incorrect")
        end

    end
end