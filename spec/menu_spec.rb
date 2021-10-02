require "menu"

RSpec.describe Menu do
  it "stores a list of dishes and prices" do
    menu = Menu.new
    expect(menu.see_menu).to include("Mac & Cheese" => 7.50)
  end

end
