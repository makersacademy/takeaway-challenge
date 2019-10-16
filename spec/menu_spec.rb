require 'menu'

describe Menu do
  it 'displays 5 menu items with prices' do
    menu = Menu.new
    expect { menu.view }.to output("Pizza - £10, Burger - £5, Chips - £2, Coffee - £3, Coke - £2").to_stdout
  end
end
