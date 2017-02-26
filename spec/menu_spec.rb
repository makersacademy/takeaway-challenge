require 'menu'
require './lib/dishes'

describe Menu do
  subject(:dishes) { Dishes.new(menu_item) }
  subject(:menu) { described_class.new(dishes) }
  
  let (:menu_item) do
    { Pizza: 7.99,
      Pasta: 5.50 }
  end

  it 'prints the menu' do
    printed_menu = "Pizza: £7.99", "Pasta: £5.50"
    expect(menu.print_menu).to eq printed_menu
  end
end
