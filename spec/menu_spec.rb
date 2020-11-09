require 'menu'

describe Menu do

  it "initializes with menu items" do
    expect(subject.menu).to eq Menu::MENU
  end

  it "displays a menu" do
    menu = Menu.new({"Burger" => 5, "Fries" => 3, "Drink" => 2})
    expect{ menu.view_menu }.to output("----------MENU----------\nItem: Burger, Price: £5\nItem: Fries, Price: £3\nItem: Drink, Price: £2\n------------------------\n").to_stdout
  end

  it "checks we have the dish" do
    menu = Menu.new({"Burger" => 5, "Fries" => 3, "Drink" => 2})
    expect{ menu.item_available?("Pizza") }.to raise_error "Error - don't think we have that. Have you checked your spelling?"
    expect(menu.item_available?("Burger")).to eq "Burger"
  end

end
