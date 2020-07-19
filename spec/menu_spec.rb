require "menu"

describe Menu do
  
  subject(:menu) { described_class.new }
  
  let(:dishes) do
    {
      :rice => 4.0,
      :noodles => 6.5,
      :chicken => 8.0
    }
  end
  
  it "knows the menu" do
    menu.load_menu
    expect(menu.dishes).to eq dishes
  end
  
  it "prints the menu" do
    menu.load_menu
    printed_menu = "Rice: £4.00, Noodles: £6.50, Chicken: £8.00"
    expect(menu.menu_print).to eq(printed_menu)
  end
  
  it "calculates a price of an item" do
    menu.load_menu
    expect(menu.price(:chicken)).to eq(dishes[:chicken])
  end
end
