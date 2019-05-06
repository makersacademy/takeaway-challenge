require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) {{
    Pizza: 10.50,
    Pasta: 8.50, 
    Risotto: 7.00
  }}

  it 'has a menu with dishes' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'shows a menu with dishes' do 
    printed_menu = "Pizza: £10.50, Pasta: £8.50, Risotto: £7.00"
    expect(menu.print).to eq(printed_menu)
  end

  it 'tells if a dish is on the menu' do
    expect(menu.has_dish?(:Pizza)).to be true
  end

  it 'tells if a dish is not on the menu' do
    expect(menu.has_dish?(:Brownies)).to be false
  end

  it 'calculates the price of the selected dishes' do
    expect(menu.price(:pizza)).to eq(dishes[:pizza])
  end
end

