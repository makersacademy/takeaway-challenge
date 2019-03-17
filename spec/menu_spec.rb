require "menu"

describe Menu do

  it "creates an instance of menu class" do
    menu = Menu.new
    expect(menu).to be_a(Menu)
  end

  it "prints out the menu with dish names and dish prices" do
    menu = Menu.new
    dish1 = double
    dish2 = double
    dish3 = double
    dish4 = double
    menu.add_dish(dish1)
    menu.add_dish(dish2)
    menu.add_dish(dish3)
    menu.add_dish(dish4)
    expect(menu.print).to eq([dish1, dish2, dish3, dish4])
  end
end
