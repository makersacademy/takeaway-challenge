require 'order'
require 'dish'
require 'receipt'
require 'menu'

RSpec.describe "menu, order, dish and receipt integration" do

  it "adds dishes from menu to the order" do
    menu = Menu.new
    dish_1 = Dish.new("Soup", 5.99)
    dish_2 = Dish.new("Pizza", 9.99)
    menu.add(dish_1)
    menu.add(dish_2)
    order = Order.new(menu)
    order.add(dish_1)
    order.add(dish_2)
    expect(order.check_dishes).to eq ["Soup: £5.99", "Pizza: £9.99"]
  end

  it "adds dishes to the order and checks current price" do
    menu = Menu.new
    dish_1 = Dish.new("Soup", 5.99)
    dish_2 = Dish.new("Pizza", 9.99)
    menu.add(dish_1)
    menu.add(dish_2)
    order = Order.new(menu)
    order.add(dish_1)
    order.add(dish_2)
    expect(order.check_price).to eq "£15.98"
  end

  it "removes dishes from the order" do
    menu = Menu.new
    dish_1 = Dish.new("Soup", 5.99)
    dish_2 = Dish.new("Pizza", 9.99)
    dish_3 = Dish.new("Cake", 4.99)
    dish_4 = Dish.new("Drink", 4.50)
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    menu.add(dish_4)
    order = Order.new(menu)
    order.add(dish_1)
    order.add(dish_2)
    order.add(dish_3)
    order.add(dish_4)
    order.remove(dish_1)
    order.remove(dish_3)
    order.remove(dish_4)
    expect(order.check_dishes).to eq ["Pizza: £9.99"]
  end

  it "adds dishes to my order and prints the receipt" do
    menu = Menu.new
    dish_1 = Dish.new("Soup", 5.99)
    dish_2 = Dish.new("Pizza", 9.99)
    dish_3 = Dish.new("Cake", 4.99)
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    order = Order.new(menu)
    order.add(dish_1)
    order.add(dish_3)
    order.submit
    receipt = Receipt.new(order)
    expect(receipt.print).to eq "Soup: £5.99, Cake: £4.99, Total: £10.98"
  end

  it "checks if an order has been completed" do
    menu = Menu.new
    dish_1 = Dish.new("Soup", 5.99)
    dish_2 = Dish.new("Pizza", 9.99)
    dish_3 = Dish.new("Cake", 4.99)
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    order = Order.new(menu)
    order.add(dish_1)
    order.add(dish_3)
    order.submit
    expect(order.completed?).to eq true
  end

  it "raises an error if non-existent menu item is added to order" do
    menu = Menu.new
    dish_1 = Dish.new("Soup", 5.99)
    dish_2 = Dish.new("Pizza", 9.99)
    dish_3 = Dish.new("Sushi", 19.99)
    menu.add(dish_1)
    menu.add(dish_2)
    order = Order.new(menu)
    expect{order.add(dish_3)}.to raise_error "This dish doesn't exist on the menu"
  end

end