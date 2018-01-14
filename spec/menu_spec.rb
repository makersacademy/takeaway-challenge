require 'takeaway'
require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      pierogi: 4.00,
      kopytka: 2.00,
      bigos: 5.20
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    showed_menu = 'Pierogi £4.00, Kopytka £2.00, Bigos £5.20'
    expect(menu.show).to eq(showed_menu)
  end

  it 'says if the dish is on the menu' do
    expect(menu.has_dish?(:pierogi)).to be true
  end

  it 'says if the dish is not on the menu' do
    expect(menu.has_dish?(:ramen)).to be false
  end

end
