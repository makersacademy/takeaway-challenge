require 'menu'

describe Menu do

  let ( :menu ) { Menu.new }

  it "has a menu" do
    menu
  end

  it "will list the menu for you" do
    expect(menu.list).to eq([
      {item: 1, pizza: "Kenjutsu: Chicken, Pepperoni, Green Chili"},
      {item: 2, pizza: "Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage"},
      {item: 3, pizza: "Taijutsu: Prawn, Anchovy, Pineapple, Tripe"}
    ])
  end


end
