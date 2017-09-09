require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'prints menu header' do
    expect(menu.print_header).to eq ("WELCOME TO NERO'S PIZZERIA")
  end

  it 'prints the menu to the screen' do
    expect(menu.print_menu).to eq ("POLLO PIZZA £12\n
    VEGETARIAN PASTA £11\n
    SEAFOOD RISOTTO £15\n
    TIRAMISU £10")
  end

  it 'prints menu footer' do
    expect(menu.print_footer).to eq ("IF YOU DO NOT LIKE THE FOOD, PLEASE DO NOT RETURN")
  end
end
