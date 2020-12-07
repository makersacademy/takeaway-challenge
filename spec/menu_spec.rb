require './lib/menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      burger: 5.00,
      chips: 1.50,
      chicken: 2.00
    }
  end

  it "contains a list of dishes and prices" do
    expect(menu.dishes).to eq dishes
  end

  it "shows a list of dishes with prices" do
    printed_menu = "Burger £5.00, Chips £1.50, Chicken £2.00"
    expect(menu.show_menu).to eq printed_menu
  end

  it "tells if dish is on menu" do
    expect(menu.has_dish?(:chicken)).to be true
  end

  it "tells if dish isn't on menu" do
    expect(menu.has_dish?(:rice)).to be false
  end

  it "shows price" do
    expect(menu.price(:chicken)).to eq dishes[:chicken]
  end

end
