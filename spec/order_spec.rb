require 'order'

describe Order do
    let(:menu) {Menu.new} #creating double for Menu.new instance
    let(:order) {described_class.new(menu)} #double for the described class (order) then creating instance of menu

    it "raises error when item is not displayed in menu" do
        expect {order.add_item("Lettuce", 1)}.to raise_error("This item is not on the menu")
    end

    it "can add add a item on the menu to the order array" do
        order.add_item("Chips", 2)
        expect(order.order).to include(["Chips", 2])
    end

    it "should print total order" do
        order.add_item("Chips", 3)
        expect(order.total).to eq(6)
    end
end