require 'order'
require 'menu'

describe Order do
    menu = Menu.new
    menu.add_dish("Fish",9)
    menu.add_dish("Korma",8)
    order = Order.new(menu,1,2)
    order.submit_order
    it "#submit_order should put chosen dishes into an order" do
        expect(order.order[0]).to be_a(Dish)
        expect(order.order[1]).to be_a(Dish)
    end

    it "#bill to return a bill with names and price of each item" do
        expect(order.bill).to include(:dish => 'Fish')
        expect(order.bill).to include(:price => 8)
    end

end