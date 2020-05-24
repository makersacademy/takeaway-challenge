require "menu"

describe Menu do
  subject(:menu) { described_class.new }
  
  it "has a list of dishes and prices" do
    expect(menu.dishes).to eq(Menu::LIST)
  end

  it "read the list with dishes and prices" do
    menu_list = "Potato Wedges £2.50, Fish&Chips £8.50, Chicken Wings £5.99, Breadsticks £3.99, Hallomi Fries £5.50, Cheese Cake £6.50"
    expect(menu.read).to eq(menu_list)
  end
    
end
