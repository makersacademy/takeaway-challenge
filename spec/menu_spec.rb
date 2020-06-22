require 'menu'

describe Menu do

  subject(:menu) { Menu.new(dishes) }

  let(:dishes) do
    {
      'chicken satay (5 pieces)': 1.99,
      'fried rice': 2.50,
      'won ton mee': 3.00,
      'loh mee': 6.50,
      'curry mee': 6.50,
      'seafood laksa': 5.50,
      'tofu fa': 3.00,
    }
  end
  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    #printed_menu = "Chicken satay (5 pieces) £1.99, Fried rice £2.50, Won ton mee £3.00, Loh mee £6.50, Curry mee £6.50, Seafood laksa £5.50, Tofu fa £3.00"
    new_printed_menu = dishes.map { |name, price| "%s £%.2f" % [name.to_s.capitalize, price] }.join(", ")
    expect(menu.print).to eq(new_printed_menu)
  end

end