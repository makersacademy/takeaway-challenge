require 'menu'

describe Menu do

  let(:dishes) do
  "Pita: £2.50\nDolmades: £6.50\nMusaka: £7.99\nZazzikki: £4.99"
  end

  subject(:menu) { described_class.new } 

  it 'prints a menu with dishes and prices' do
    expect(menu.view_menu).to eq(dishes)
  end

  it 'returns the price of the dish' do
    expect(menu.price(:pita)).to eq described_class::DEFAULT_MENU[:pita]
  end  
end