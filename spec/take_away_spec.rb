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

  context "#add to cart" do
    
    it "selected dish" do
      dish = double("dish")
      menu = double("menu", select_dish: dish)
      take_away = TakeAway.new(menu: menu)
      take_away.add_to_cart(double())
      expect(take_away.cart).to include(dish)
    end

    it "update existing dish quantity if already in the cart" do
      menu = double("menu", select_dish: {dish: "margherita", quantity: 1})
      take_away = TakeAway.new(menu: menu)
      2.times { take_away.add_to_cart(double(), double()) }
      expect(take_away.cart.last[:quantity]).to eq 2
    end

  end

  it "list the selected items" do
    dish = double("dish")
    menu = double("menu", select_dish: dish)
    take_away = TakeAway.new(menu: menu)
    take_away.add_to_cart(double())
    expect(take_away.cart).not_to be_empty
  end

end
