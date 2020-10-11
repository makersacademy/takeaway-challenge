require 'menu'
describe Menu do
  subject(:menu) { Menu.new }

  it 'displays menu: food followed by pricing' do
    expect(menu.display_menu).to eq("Egg fried rice: £12.50")
  end

end
