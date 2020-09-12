require 'order_item'



describe OrderItem do
    let(:dish_id)   {1}
    let(:quantity)   {3}
    let(:sub_total)   {9}
    let(:order_item_double) {double(:dish_id => 1, :quantity=>2, :sub_total=>9 )}




    describe "#sub_total" do
        it "check the correct subtotal is shown in order item" do   
        expect(order_item_double.sub_total).to eq(9)
        end
    end
end