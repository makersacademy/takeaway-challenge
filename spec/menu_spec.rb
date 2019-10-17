require 'menu'

describe Menu do
  it 'displays 5 menu items with prices' do
    menu = Menu.new
    expect { menu.view }.to output("Pizza - £10\nBurger - £5\nChips - £2\nCoffee - £3\nCoke - £2\n").to_stdout
  end
end
