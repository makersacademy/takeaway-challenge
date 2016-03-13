require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes)}

  let(:dishes) do
    {
      pizza: 12.50,
      burger: 7.50
    }
  end

  it "1.  has a list of dishes and prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "2.# prints a list of dishes with prices" do
    printed_menu = "Pizza £12.50, Burger £7.50"
    expect(menu.print).to eq(printed_menu)
  end

  it "3.# tells if a dish is on the menu" do
    expect(menu.has_dish?(:pizza)).to be true
  end

  it "4. tells if a dish is not on he menu" do
    expect(menu.has_dish?(:sandwich)).to be false
  end

end
