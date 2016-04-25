require "menu"

describe Menu do

  let(:menu) { Menu.new }

  it "displays a menu when called" do
    expect(menu.view).to be nil
  end

  it "passes the menu hash when called" do
    expect(menu.send_menu).to be_a Hash
  end

end
