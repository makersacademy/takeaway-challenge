require 'Menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) { { pizza: 1.00, pasta: 2.00 } } 

  it "displays a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "displays the list of dishes with prices" do
    displayed_menu = "pizza £1.00, pasta £2.00"
    expect(menu.display_menu).to eq(displayed_menu)
  end 

  it "knows if a dish is on the menu" do
    expect(menu.has_dish?(:pasta)).to be true
  end

  it "knows if a dish is not on the menu" do
    expect(menu.has_dish?(:potaoes)).to be false
  end

  it "calculates the price" do
    expect(menu.price(:pizza)).to eq(dishes[:pizza])
  end
    
end
