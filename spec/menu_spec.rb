require 'menu'

describe Menu do
  menu = Menu.new

  it "should not be empty" do
    expect(menu.dishes).to_not be_empty
  end

  it "should include kebab" do
    expect(menu.view_menu).to include "kebab"=>3
  end

  it "should allow dishes to be added to it" do
    menu.add_dish_to_menu("wrap", 3)
    expect(menu.dishes.length).to eq 5
  end




end
