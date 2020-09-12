require 'order'

describe Order do

let(:order) {Order.new}
    describe "List of menu items" do
        it "Show list of menu items when calling order method" do
        expect(order).to respond_to(:display_menu)
        end
    end


end