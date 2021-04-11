require 'menu'
describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      chicken: 3.50,
      veg: 2.75
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = "Chicken £3.50, Veg £2.75"
    expect(menu.print).to eq(printed_menu)
  end

  it 'tells if a dish is on the menu' do
    expect(menu.has_dish?(:chicken)).to be true
  end

  it 'tells if a dish is not on the menu' do
    expect(menu.has_dish?(:beef)).to be false
  end

  it 'tells us the price of an order' do
    expect(menu.price(:chicken)).to eq(dishes[:chicken])
  end
end
