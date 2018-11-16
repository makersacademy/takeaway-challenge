require 'menu'

describe 'menu' do
  it 'should print the full menu' do
    menu = Menu.new
    expect { menu.print_menu }.to output("Beef Burger - £7.00\nHam Burger - £8.50\nCheese Burger - £9.25\nFrench Fries - £2.00\nOnion Rings - £3.40\n").to_stdout
  end
end
