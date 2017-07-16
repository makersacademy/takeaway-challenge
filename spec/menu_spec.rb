require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      pork: 4.99,
      prawns: 4.80
    }
  end

  it 'holds a list of dishes with prices' do
    expect(menu.dishes).to eq dishes
  end
  it 'displays a list of dishes with prices' do
    display_menu = 'Pork £4.99, Prawns £4.80'
    expect(menu.read).to eq(display_menu)
  end
end
