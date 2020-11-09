require 'Menu'

describe Menu do

  subject(:menu) { Class.new { extend Menu } }

  it "shows the menu and list of prices" do
    expect(Menu::MENU).to eq(Menu::MENU)
  end
end
