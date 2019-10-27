require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    { coffee: 3.00,
      burger: 9.50,
      pizza: 7.80 }
  end

  it 'displays a menu with dishes and prices' do
    expect(subject.dishes).to eq(dishes)
  end

  it 'prints out a list of dishes and prices' do
    printed_menu = "Coffee, £3.00, Burger, £9.50, Pizza, £7.80"
    expect(menu.print).to eq(printed_menu)
  end

  it "true if a dish is on the menu" do
    expect(menu.dish?(:coffee)).to be true
  end

  it 'false if dish is not on the menu' do
    expect(menu.dish?(:chicken)).to be false
  end

  it 'knows the price of a dish' do
    expect(menu.price(:burger)).to eq(dishes[:burger])
  end
end
