require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      pizza: 9.99,
      pasta: 8.50
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = "Pizza £9.99, Pasta £8.50"
    expect(menu.print_menu).to eq(printed_menu)
  end

  it 'tells if a dish is available on the menu' do
    expect(menu.available?(:pizza)).to be true
  end

  it 'tells if a dish is not available on the menu' do
    expect(menu.available?(:chicken)).to be false
  end

  it 'gives the price' do
    expect(menu.price(:pizza)).to eq(dishes[:pizza])
  end
end
