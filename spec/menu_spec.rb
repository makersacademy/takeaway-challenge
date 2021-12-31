require 'menu'

describe Menu do

  subject(:menu)  { described_class.new(dishes) }

  let(:dishes) do
    {
      noodles: 4.00,
      squid: 5.60 
    }
  end

  it 'has a list of dishes inclduing prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = 'Noodles £4.00, Squid £5.60'
    expect(menu.print).to eq(printed_menu)
  end
end