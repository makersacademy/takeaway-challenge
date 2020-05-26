require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      raclette: 6,
      fondue: 15
    }
  end
  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = 'Raclette £6.00, Fondue £15.00'
    expect(menu.print).to eq(printed_menu)
  end

  it "tells if a dish is on the menu" do
    expect(menu.has_dish?(:raclette)).to be true
  end

  it "tells if a dish is on the menu" do
    expect(menu.has_dish?(:beef)).to be false
  end

end
