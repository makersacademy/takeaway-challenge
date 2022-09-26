require 'dish.rb'
require 'menu.rb'
require 'order.rb'
require 'receipt.rb'

RSpec.describe "integration"  do 
    context "given a list of dishes" do
        it "returns a menu list of dishes" do
            menu = Menu.new
            dish_1 = Dish.new("sandwich",10)
            dish_2 = Dish.new("salmon",5)
            dish_3 = Dish.new("pizza",3)
            menu.add(dish_1)
            menu.add(dish_2)
            menu.add(dish_3)
           expect(menu.list).to eq([dish_1, dish_2, dish_3])
        end
    end

        it "creates an order list based on customer selection" do
            menu = Menu.new
            order = Order.new(menu)
            dish_1 = Dish.new("sandwich",10)
            dish_2 = Dish.new("salmon",5)
            dish_3 = Dish.new("pizza",3)
            menu.add(dish_1)
            menu.add(dish_2)
            menu.add(dish_3)
            order.pick(dish_1)
            order.pick(dish_2)
            order.pick(dish_3)
            expect(order.list).to eq [dish_1,dish_2,dish_3]
        end

        it "can delete dishes from an order" do
            menu = Menu.new
            order = Order.new(menu)
            dish_1 = Dish.new("sandwich",10)
            dish_2 = Dish.new("salmon",5)
            dish_3 = Dish.new("pizza",3)
            menu.add(dish_1)
            menu.add(dish_2)
            menu.add(dish_3)
            order.pick(dish_1)
            order.pick(dish_2)
            order.pick(dish_3)
            order.remove(dish_3)
            expect(order.list).to eq ([dish_1, dish_2])
        end

        it "returns the total price of order made" do
            menu = Menu.new
            order = Order.new(menu)
            dish_1 = Dish.new("sandwich",10)
            dish_2 = Dish.new("salmon",5)
            dish_3 = Dish.new("pizza",3)
            menu.add(dish_1)
            menu.add(dish_2)
            menu.add(dish_3)
            order.pick(dish_1)
            order.pick(dish_2)
            order.pick(dish_3)
            receipt = Receipt.new(order)
            expect(receipt.total).to eq (18)
        end

        it "returns an itemised receipt for order made" do
            menu = Menu.new
            order = Order.new(menu)
            dish_1 = Dish.new("sandwich",10)
            dish_2 = Dish.new("salmon",5)
            dish_3 = Dish.new("pizza",3)
            menu.add(dish_1)
            menu.add(dish_2)
            menu.add(dish_3)
            order.pick(dish_1)
            order.pick(dish_2)
            order.pick(dish_3)
            receipt = Receipt.new(order)
            receipt.total
            expect(receipt.itemised_receipt).to eq "Items totalled: sandwich £10 /salmon £5 /pizza £3 / Total amount: £18"
        end





end