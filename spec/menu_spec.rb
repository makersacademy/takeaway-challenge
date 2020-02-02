require "menu"

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      chicken: 3.50,
      falafel: 4.50,
    }
  end
  it "has a list of dishes and prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints the list of dishes and prices" do
    printed_menu = "Chicken £3.50, Falafel £4.50"
    expect(menu.print).to eq(printed_menu)
  end

  it 'can tell if a dish is on the menu' do
      expect(menu.has_dish?(:chicken)).to be true
  end
end
