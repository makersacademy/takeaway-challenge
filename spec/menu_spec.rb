require "menu"

RSpec.describe Menu do
  it "stores a list of dishes and prices" do
    list = {"Mac & Cheese" => 7.50,
      "Garlic Bread" => 3.00,
      "Lamb Chops" => 9.50,
      "Pizza Margherita" => 8.00,
      "Pizza Capriciosa" => 12.00,
      "Lasagna" => 11.25}
    menu = Menu.new
    expect(menu.see_menu).to include("Mac & Cheese" => 7.50)
  end

end
