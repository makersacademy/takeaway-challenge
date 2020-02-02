require 'menu'
describe Menu do
  # dependency injection --below
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      sausage: 4.50,
      chips: 2.99
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end
  it ' prints a list of dishes with prices' do
    printed_menu = "Sausage £4.50, Chips £2.99"
    expect(menu.print).to eq(printed_menu)
  end
  it 'tells if a dish is  on the menu' do
    expect(menu.has_dish?(:sausage)).to be true
  end
  it 'tells if a dish is not on the menu' do
    expect(menu.has_dish?(:fish)).to be false
  end
end
