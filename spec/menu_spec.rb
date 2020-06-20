require "menu"
describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      prawns: 3.50,
      curry: 7.00
    }
  end

  it 'has a list of dishes and prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes and their prices' do
    printed_menu = "prawns £3.50, curry £7.00"
    expect(menu.print).to eq(printed_menu)
  end

  it 'checks if a dish is on a menu' do
  expect(menu.has_dish?(:prawns)).to be true
  end
  it 'checks if a dish is not on the menu' do
  expect(menu.has_dish?(:chicken)).to be false
  end
  it 'tells us the price' do
    expect(menu.price(:rice)).to eq(dishes[:rice])
  end
  end
