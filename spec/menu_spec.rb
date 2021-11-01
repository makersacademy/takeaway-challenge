require 'menu'

describe Menu do
  let(:dishes) do
    { 'california roll' => 9, 'fried chicken' => 7, 'dumplings' => 3 }
  end
  let(:menu) { Menu.new(dishes) }

  it 'contains a list of dishes and prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of available dishes and prices' do
    menu_output =
      'california roll --- £9, fried chicken --- £7, dumplings --- £3'
    expect(menu.list_menu).to eq(menu_output)
  end
end
