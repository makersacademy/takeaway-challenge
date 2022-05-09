require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {burger: 5.99,
    chips: 1.59,
    coke: 0.99
  }
  end
  it 'is a menu' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints the menu' do
    printed_menu = "Burger £5.99, Chips £1.59, Coke £0.99"
    expect(menu.print_menu).to eq(printed_menu)
  end
end