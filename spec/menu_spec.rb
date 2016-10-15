require 'menu'

describe Menu do

  let(:menu){ Menu.new([{name: "Chocolate Fudge Cake", price: 3.75}]) }

  it "can check if a menu item is in stock" do
    expect(menu.check_stock("Chocolate Fudge Cake")).to eq({name: "Chocolate Fudge Cake", price: 3.75})
  end

  it "can inform the customer if a menu item doesn't exist" do
    expect{menu.check_stock("Burger")}.to raise_error("Sorry, we do not sell this item")
  end

end
