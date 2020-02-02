require "menu"

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      salad: 3.50,
      falafel: 4.50,
    }
  end
  it "has a list of dishes and prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints the list of dishes and prices" do
    printed_menu = "Salad £3.50, Falafel £4.50"
    expect(menu.print).to eq(printed_menu)
  end

  it 'can tell if a dish is on the menu' do
      expect(menu.has_dish?(:salad)).to be true
  end

  it 'calculates prices' do
    expect(menu.price(:salad)).to eq(dishes[:salad])
  end
end
