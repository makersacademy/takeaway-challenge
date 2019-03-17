require 'menu'

describe Menu do
  let(:dish1) { double :dish }
  let(:dish2) { double :dish }

  it "should set @dishes to an empty array when initialized" do
    menu = Menu.new
    expect(menu.dishes).to eq []
  end

  it "should push a dish object to the @dishes array when add_dish is called" do
    menu = Menu.new
    menu.add_dish(dish1)
    expect(menu.dishes).to eq [dish1]
  end

  it "should be able to hold multiple dish object in the @dishes array" do
    menu = Menu.new
    2.times { menu.add_dish(dish1) }
    expect(menu.dishes).to eq [dish1, dish1]
  end
  it "should be able to return a dish from the @dishes array when dish name passed into find_dish method" do
    menu = Menu.new
    menu.add_dish(dish1)
    menu.add_dish(dish2)
    allow(dish1).to receive(:name) { "Pizza" }
    allow(dish2).to receive(:name) { "Pasta" }
    expect(menu.find_dish("Pasta")).to eq dish2
  end
  it "should print out nicely formatted list of menu items when print_menu method is called" do
    menu = Menu.new
    menu.add_dish(dish1)
    menu.add_dish(dish2)
    allow(dish1).to receive(:name) { "Pizza" }
    allow(dish2).to receive(:name) { "Pasta" }
    allow(dish1).to receive(:price) { 8 }
    allow(dish2).to receive(:price) { 7.5 }
    expect { menu.print_menu }.to output("    Today's Menu    \n     Pizza - £8     \n    Pasta - £7.5    \n").to_stdout
  end
end
