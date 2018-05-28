require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'shows the menu' do
    menu_hash = {banana: 1.99, strawberry: 2.99, peach: 3.99, coconut: 4.99}
    expect(menu.menu_list).to eq (menu_hash)
  end
end
