require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      lamb: 4.50,
      chicken: 3.50,
      samosa: 2.00
    }
  end

  it 'Holds a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'Prints a list of dishes with prices' do
    printed_menu = "Lamb £4.50, Chicken £3.50, Samosa £2.00"
    expect(menu.print).to eq (printed_menu)
  end

  it 'checks if a dish is on the menu' do
    expect(menu.has_dish?(:lamb)).to be true
  end

  it 'checks if a dish is not on the menu' do
    expect(menu.has_dish?(:fish)).to be false
  end

  it 'Calculates the price for items ordered' do
    expect(menu.price(:lamb)).to eq(dishes[:lamb])
  end

end
