require "./lib/restaurant"
require "./lib/menu"
require "./lib/dish"

describe Restaurant do

  subject do
    dishes = [Dish.new("Burger", 8), Dish.new("Pizza", 10)]
    menu = Menu.new(dishes)
    Restaurant.new(menu)
  end

  it "has a menu" do
    expect(subject.menu.dishes.length).to eq(2)
  end

  it "can recieve order" do
    burger = Dish.new("Burger", 8)
    pizza = Dish.new("Pizza", 10)
    order_dishes = {burger => 1,
                    pizza => 2}
    order = subject.submit_order("Sarah", "0123456789", order_dishes)
    expect(order.customer_name).to eq("Sarah")
  end

  it "raises an error when trying to order a dish not on the menu" do
    dishes = {Dish.new("Sushi", 20) => 1}
    expect{subject.submit_order("Sarah", "0123456789", dishes)}
      .to raise_error "Dish not on menu"
  end

end