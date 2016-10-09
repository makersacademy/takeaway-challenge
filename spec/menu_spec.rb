require 'menu'

describe Menu do

  subject(:menu) {described_class.new}
  DISHES = [{name: "Chicken Teriyaki", price: 5},
            {name: "Ramen", price: 7},
            {name: "Pad Thai", price: 5},
            {name: "Chocolate ice cream", price: 2}]

  it "can be displayed in a nice format" do
    output = "\nMENU\n"
    DISHES.each {|dish| output += "#{dish[:name].ljust(Menu::MAX_NAME_LENGTH,' ')} £#{dish[:price]}\n"}
    output += "\n"
    expect(menu.show).to eq output
  end

  it "has a list of dishes" do
    expect(menu.dishes).to include a_kind_of Dish
  end
end
