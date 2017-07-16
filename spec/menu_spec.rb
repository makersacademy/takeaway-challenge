require 'menu'

describe Menu do
  subject(:menu) {Menu.new}
  it 'should print the list of meals' do
    expect(menu.print_menu).to eq "Margherita is at £8
Pepperoni is at £10
Spiced Salami is at £11.5
Carbonara is at £12.5
Tiramisu is at £5.5"
  end
end
