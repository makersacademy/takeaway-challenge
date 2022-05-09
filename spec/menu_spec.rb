require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it "can view the menu" do
    expect(menu.menu).to eq(Menu::MENU)
  end

  it "shows the menu when called" do
    printed_menu = "Hotdog £5.00, Fries £3.50"
    expect(menu.print_menu).to eq(printed_menu)
  end

end
