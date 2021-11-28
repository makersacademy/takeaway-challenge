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

    # bug in the test to resolve
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

  it "return the total price" do
    menu = double("menu", select_dish: {dish: "margherita", price: "6.50", quantity: 5})
    take_away = TakeAway.new(menu: menu)
    take_away.add_to_cart(double())
    total = 6.50 * 5
    expect(take_away.total_price).to eq("total price: £#{total}")
  end

  context "#place an order" do
    
    it "raise an error if shopping cart is empty" do
      take_away = TakeAway.new
      expect{ take_away.place_order }.to raise_error("The cart is empty, add some items before placing an order!")
    end

    it "send a sms message confirming the order was placed" do
      dish = double("dish")
      menu = double("menu", select_dish: dish)
      sms = double("sms", send_sms: double("message", body: "Thank you! Your order was placed"))
      take_away = TakeAway.new(menu: menu, sender: sms)
      take_away.add_to_cart(double())
      expect(take_away.place_order).to eq("Thank you! Your order was placed")
    end

  end

end
