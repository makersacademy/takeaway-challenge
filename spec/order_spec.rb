require 'order'


describe Order do

    it "should create a new instance of order" do
        order = Order.new
    expect(order).to be_kind_of(Order)
    end

    # it "should be able to select a number of dishes from the menu" do
    #     dish = Dish.new
    #    expect(order.selection).to eq(menu1.price + menu2.price)

end
