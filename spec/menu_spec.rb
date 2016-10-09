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
    expect(menu.view_menu).to eq [{:dish=>1, :name=>"kebab", :price=>3},
 {:dish=>2, :name=>"burger", :price=>4},
 {:dish=>3, :name=>"fries", :price=>2},
 {:dish=>4, :name=>"shake", :price=>2.5}]
  end

end
