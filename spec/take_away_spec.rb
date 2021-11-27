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
end
