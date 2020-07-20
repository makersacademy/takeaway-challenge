require "menu"

describe Menu do
  it "shows a menu of dishes with prices" do
    menu = Menu.new
    expect(menu.list).to eq Menu::MENU
  end
end
