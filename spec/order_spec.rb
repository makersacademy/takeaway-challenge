require 'order.rb'

RSpec.describe Order do
    
    it "constructs" do
        menu = double :menu
        order = Order.new(menu)
        expect(order.list).to eq ([])
    end

    it "creates an order list based on dishes selected" do
        menu = double :menu
        order = Order.new(menu)
        dish = double :dish
        dish1 = double :dish1
        dish2 = double :dish2
        order.pick(dish)
        order.pick(dish1)
        order.pick(dish2)
        expect(order.list).to eq ([dish,dish1,dish2])
    end

    it "removes dish from order" do
        menu = double :menu
        order = Order.new(menu)
        dish = double :dish
        dish1 = double :dish1
        dish2 = double :dish2
        order.pick(dish)
        order.pick(dish1)
        order.pick(dish2)
        order.remove(dish)
        expect(order.list).to eq ([dish1,dish2])
    end

    it "removes multiple dishes from and order" do
        menu = double :menu
        order = Order.new(menu)
        dish = double :dish
        dish1 = double :dish1
        dish2 = double :dish2
        order.pick(dish)
        order.pick(dish1)
        order.pick(dish2)
        order.remove(dish)
        order.remove(dish1)
        expect(order.list).to eq ([dish2])
    end

end