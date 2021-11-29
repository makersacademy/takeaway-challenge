require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'should print menu list with prices' do
    print_menu = menu.print_menu
    expect(menu.print_menu).to eq(print_menu)
  end
end