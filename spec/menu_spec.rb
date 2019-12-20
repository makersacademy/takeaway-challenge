require "menu"

describe Menu do
  it "creates and instance of Menu" do
    menu = Menu.new
    expect(menu).to be_a Menu
  end

end
