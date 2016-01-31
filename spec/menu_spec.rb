require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes)}

  let(:dishes) do
    {
      starter: 4.95,
      main:    8.65,
      dessert: 5.35
    }
  end

  it 'contains a menu of dishes' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'shows a list of the dishes' do
    show_menu = 'Starter: £4.95, Main: £8.65, Dessert: £5.35'
    expect(menu.show).to eq(show_menu)
  end

end
