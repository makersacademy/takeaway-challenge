require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do {
   Margherita:                    4.00,
   Capricciosa:                   4.50
  }
  end

  it 'has a list of dishes and their prices' do
    expect(menu.dishes).to eq dishes
  end

  it 'shows a list of dishes and their prices' do
    expect(menu.show_menu).to eq "Margherita £4.00, Capricciosa £4.50"
  end

end
