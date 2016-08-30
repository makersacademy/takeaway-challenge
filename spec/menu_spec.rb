require 'menu'

describe Menu do
  it "returns the menu items with their prices" do
    expect(subject.view_menu).to eq(Menu::DISHES)
  end
end
