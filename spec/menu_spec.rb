require 'menu'

describe Menu do
  let(:menu) { {burger: 5.99, pizza: 7.99, fries: 3.99} }
  let(:new_menu) { Menu.new(menu) }

  it 'should have a list of dishes with prices' do
    new_menu
    expect(new_menu.menu).to include(fries: 3.99)
  end

  it 'should show the menu' do
    new_menu
    expect(new_menu.show_menu).to eq(menu)
  end
end
