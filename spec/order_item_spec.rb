require 'order_item'



describe OrderItem do
    let(:dish_id)   {1}
    let(:quantity)   {3}
    let(:sub_total)   {9}
    let(:order_item_double) {double(:dish_id => 1, :quantity=>2, :sub_total=>9 )}

describe "#initialize" do
    describe "New Order Item will take 3 arguments" do
        it "new OrderItem should take 3 arguments" do
            expect(OrderItem.new(1,2,3)).to be_a(OrderItem)
        end
    end
end

    describe "#sub_total" do
        it "Display method will respond to menu class" do
            expect(order_item_double).to respond_to(:sub_total)
        end

        it "check the correct subtotal is shown in order item" do   
            expect(order_item_double.sub_total).to eq(9)
        end
    end
end