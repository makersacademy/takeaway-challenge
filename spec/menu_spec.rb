require 'menu'

describe Menu do

  subject(:menu) { Menu.new(dishes) }

  let(:dishes) do
    {
      chicken: 3.99,
      rice: 2.50
    }
  end
  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = "Chicken £3.99, Rice £2.50"
    expect(menu.print).to eq(printed_menu)
  end

end