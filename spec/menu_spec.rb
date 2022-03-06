require 'menu'
require 'dish'

describe Menu do

  it { is_expected.to respond_to(:add)}

  it { is_expected.to respond_to(:print_menu)}

  it "adds dish to a list" do
    menu = Menu.new
    dish1 = Dish.new("Salmon", 5.0)
    dish2 = Dish.new("Soup", 2.0)
    menu.add(dish1)
    menu.add(dish2)
    expect(menu.dishes).to eq [dish1, dish2]
  end

  it "prints list of dishes to standard output" do
    menu = Menu.new
    dish1 = Dish.new("Salmon", 5.0)
    dish1.available=true
    menu.add(dish1)
    expect{menu.print_menu}.to output("Salmon...........................5.0\navailable\n").to_stdout
  end
end
