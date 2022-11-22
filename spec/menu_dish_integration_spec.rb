require 'menu'
require 'dish'

RSpec.describe "menu and dish integration" do

  it "adds dishes to the menu and prints menu" do
    menu = Menu.new
    dish_1 = Dish.new("Soup", 5.99)
    dish_2 = Dish.new("Pizza", 9.99)
    dish_3 = Dish.new("Cake", 4.99)
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    expect(menu.list).to eq ["Soup: £5.99", "Pizza: £9.99", "Cake: £4.99"]
  end

  it "removes dishes from the menu and prints menu" do
    menu = Menu.new
    dish_1 = Dish.new("Soup", 5.99)
    dish_2 = Dish.new("Pizza", 9.99)
    dish_3 = Dish.new("Cake", 4.99)
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    menu.remove(dish_1)
    expect(menu.list).to eq ["Pizza: £9.99", "Cake: £4.99"]
  end

  it "raises error if the same dish is added to menu" do
    menu = Menu.new
    dish_1 = Dish.new("Soup", 5.99)
    dish_2 = Dish.new("Pizza", 9.99)
    dish_3 = Dish.new("Cake", 4.99)
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    expect{menu.add(dish_2)}.to raise_error "This dish is already on the menu"
  end

  it "raises error if nonexistent dish is removed from menu" do
    menu = Menu.new
    dish_1 = Dish.new("Soup", 5.99)
    dish_2 = Dish.new("Pizza", 9.99)
    dish_3 = Dish.new("Cake", 4.99)
    dish_4 = Dish.new("Burger", 11.99)
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    expect{menu.remove(dish_4)}.to raise_error "This dish doesn't exist on the menu"
  end

end