require "menu"

describe Menu do
  
  subject(:menu) {described_class.new(dishes)}
  
  let(:dishes) do
    {
      rice: 4.00,
      noodles: 6.50,
      chicken: 8.00
    }
  end
  
  it "knows the menu" do
    expect(menu.dishes).to eq dishes
  end
  
  it "prints the menu" do
    printed_menu = "Rice: £4.00, Noodles: £6.50, Chicken: £8.00"
    expect(menu.menu_print).to eq(printed_menu)
  end
end