require "menu"

describe Menu do

  it "creates an instance of menu class" do
    menu = Menu.new
    expect(menu).to be_a(Menu)
  end

  it "receives a single dish with name/price as key/value pair" do
    menu = Menu.new
    dish1 = double
    allow(dish1).to receive(:name) { "example" }
    allow(dish1).to receive(:price) { 15.00 }
    menu.add_dish(dish1)
    expect(menu.print).to eq([{ dish1.name => dish1.price }])
  end

  it "receives multiple dish names and prices as key/value pairs and prints out" do
    menu = Menu.new
    dish1 = double
    allow(dish1).to receive(:name) { "example" }
    allow(dish1).to receive(:price) { 15.00 }
    dish2 = double
    allow(dish2).to receive(:name) { "ejemplo" }
    allow(dish2).to receive(:price) { 4.44 }
    dish3 = double
    allow(dish3).to receive(:name) { "food" }
    allow(dish3).to receive(:price) { 6.57 }
    menu.add_dish(dish1)
    menu.add_dish(dish2)
    menu.add_dish(dish3)
    expect(menu.print).to eq([{ dish1.name => dish1.price }, { dish2.name => dish2.price }, { dish3.name => dish3.price }])
  end
end
