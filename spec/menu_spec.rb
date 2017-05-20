require "menu"

describe Menu do
  let(:dish_01) { double(:dish, :name => "Saag Paneer", :description => "Cheesy green goodness", :price => 4) }
  let(:dish_02) { double(:dish, :name => "Saag Aloo", :description => "Potatoey green goodness", :price => 4) }
  subject(:menu) { described_class.new }

  it "Can add a dish to the menu" do
    menu.add_dish(dish_01)
    expect(menu.dishes).to include dish_01
  end

  it "Lists the available dishes" do
    menu.add_dish(dish_01)
    menu.add_dish(dish_02)
    expect { menu.list_dishes }.to output("1: Saag Paneer, Cheesy green goodness, £4\n2: Saag Aloo, Potatoey green goodness, £4\n").to_stdout
  end
end
