require 'menu'

describe Menu do
  menu = Menu.new

  it "Should not be empty" do
    expect(menu.dishes).to_not be_empty
  end

  it "Should include kebab" do
    expect(menu.dishes).to include {"kebab"}
  end

  it "Should allow customers to view the menu" do
    expect(menu.view_menu).to eq [{"kebab"=>3, "burger"=>4, "fries"=>2, "shake"=>2.5}]
  end

  it "Should allow items to be added to it" do
    menu.add_item_to_menu("wrap", 3)
    expect(menu.dishes.length).to eq 5
  end

end
