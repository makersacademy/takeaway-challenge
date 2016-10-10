require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes)}

  let(:dishes) do
    {
      lasagne: 4.5,
      risotto: 5.0,
      margerita: 5.5
    }
  end

  it 'returns the list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'returns a correct list of dishes with prices' do
    printed_menu = "Lasagne £4.5, Risotto £5.0, Margerita £5.5"
    expect(menu.print_dishes).to eq(printed_menu)
  end

  it "returns when a dish is on the menu" do
    expect(menu.in_menu?(:lasagne)).to be true
  end

  it "returns when a dish is NOT on the menu" do
    expect(menu.in_menu?(:paella)).to be false
  end

  it "returns the price of each meal" do
    expect(menu.price(:lasagne)).to eq(dishes[:lasagne])
  end

end
