require 'takeaway'

describe Menu do
  subject(:menu) { described_class.new }

  let(:dishes) { Menu::DEFAULT_MENU }

  it 'has a list of dishes and prices' do
    expect(menu.dishes_list).to eq(dishes)
  end
  it 'prints a menu' do
    menu_list = "Llomo_saltado £14.99, Ratatouille £9.00, Chicken_and_chips £5.50"
    expect(menu.print_menu).to eq(menu_list)
  end
end