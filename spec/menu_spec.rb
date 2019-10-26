require 'menu'

describe Menu do
  
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      pak_tod: 4.90,
      satay_gai: 5.50,
      pad_thai: 7.90,
    }
  end

  it "contains a list of dishes with their prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints a list of dishes with prices" do
    printed_menu = "Pak Tod: £4.90, Satay Gai: £5.50, Pad Thai: £7.90"
    expect(menu.print).to eq(printed_menu)
  end

  it "tells if a dish is on the menu" do
    expect(menu.has_dish?(:pak_tod)).to be true
  end

  it "tells if a dish is not on the menu" do
    expect(menu.has_dish?(:chicken)).to be false
  end

  it "calculates a price" do
    expect(menu.price(:pak_tod)).to eq(dishes[:pak_tod])
  end
   
end