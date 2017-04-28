require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      sushi: 9.99,
      ramen: 5.99,
      udon: 5.99,
      miso: 3.99
  	}
  end
  it "contains list of dishes and prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints dishes list with prices" do
    shown_menu = "Sushi £9.99, Ramen £5.99, Udon £5.99, Miso £3.99"
    expect(menu.print_menu).to eq(shown_menu)
  end

  it "tells if dish is on the menu" do
    expect(menu.has_dish?(:sushi)).to be true
  end

  it "tells if dish is not on the menu" do
    expect(menu.has_dish?(:curry)).to be false
  end
end
