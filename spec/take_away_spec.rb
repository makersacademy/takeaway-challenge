require 'take_away'

describe TakeAway do

  it "shows the menu" do
    menu = double("menu", list_dishes: [
      { dish: "marinara", price: "£5.50" },
      { dish: "margherita", price: "£6.50" }
    ])
    take_away = TakeAway.new(menu: menu)
    expect(take_away.menu).to eq (menu.list_dishes)
  end

  it "add a selected dish to the cart" do
    dish = double("dish")
    menu = double("menu", select_dish: dish)
    take_away = TakeAway.new(menu: menu)
    take_away.add_to_cart(double(), double())
    expect(take_away.cart).to include(dish)
  end

end
