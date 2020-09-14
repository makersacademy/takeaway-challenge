require 'order'

describe Order do

let(:menu_double_exist) {double(:menu_double, :price_exist => true, :get_price => 3)}
let(:menu_double_not_exist) {double(:menu_double, :price_exist => false, :get_price => 1)}
let(:order_item_double_6) {double(:order_item, :sub_total =>6)}
let(:order_item_double_9) {double(:order_item, :sub_total =>9)}
let(:order_item_class_double) {double(:order_item_class, :new => order_item_double_6)}
let(:text_message_double_false) {double(:text_message_double_false, :send=> false)}
let(:text_message_double_true) {double(:text_message_double_true, :send=> true)}
let(:order) {Order.new(menu_double_exist, 0 ,text_message_double_true, order_item_class_double)}
let(:order1) {Order.new(menu_double_not_exist, 0 ,text_message_double_true, order_item_class_double)}
let(:order2) {Order.new(menu_double_exist, 0 ,text_message_double_false, order_item_class_double)}

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
            expect{order1.add(6, 1)}.to raise_error("Dish doesn't exist")
        end
    end    

    describe "#place_order" do
        it "Placing order succesfully when subtotal and total are equal" do
            order.add(3,2)
            order.add(1,2)
            expect{order.place_order}.not_to raise_error
        end

        it "Raise error when subtotal and total are not equal" do
            order.add(3,3)
            expect{order.place_order}.to raise_error("Total is incorrect")
        end
    end

    describe "#send_text" do
       it "Twilio succesfully sending text" do
            order.add(3,2)
            expect(order.place_order).to eq("Text successfully sent")
        end

        it "Twilio succesfully sending text" do
            order2.add(3,2)
            expect(order2.place_order).to eq("Text failed to send")
        end
    end
end