require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      steak: 10,
      chicken: 5
    }
  end

  it 'has a list of dishes and prices' do
    expect(menu.dishes).to eq dishes
  end

  it 'prints a list of dishes with prices' do
    print_menu = 'Steak £10.00, Chicken £5.00'
    expect(menu.print).to eq(print_menu)
  end
end