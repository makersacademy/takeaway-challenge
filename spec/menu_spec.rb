require 'menu'

describe Menu do

  it "will list all the available dishes and their prices" do
    portuguese_menu = Menu.new
    expect(portuguese_menu).to respond_to(:dishes)
  end

  it "will store dish name and its price" do
    portuguese_menu = Menu.new
    portuguese_menu.add_dish("Bacalhau com natas", 7.5)
    expect(portuguese_menu.dishes).to include(name: "Bacalhau com natas", price: 7.5)
  end

end
