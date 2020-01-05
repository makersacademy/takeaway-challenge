require "menu"

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      pizza: 5.00,
      felafel: 5.00
    }
  end
  it 'has list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints list of dished with prices' do
    printed_menu = "Pizza: £5.00, Felafel: £5.00"
    expect(menu.print_menu).to eq(printed_menu)
  end

  it 'tells if a dish is on the menu' do 
    expect(menu.has_dish?(:pizza)).to be true
  end

  it 'tells if a dish is on the menu' do 
    expect(menu.has_dish?(:beef)).to be false
  end
end


