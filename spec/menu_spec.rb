require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  it 'It is a object menu' do
    expect(menu).to be_an(Object)
  end
  it 'Should respond to #add menu item' do
    expect(menu).to respond_to(:add_item).with(2).argument
  end
  it 'Should respond to #display menu' do
    expect(menu).to respond_to(:display_menu)
  end
  it 'Display menu list' do
    expect(menu.display_menu).to eq(menu.instance_variable_get(:@menu)).or eq("Nothing on the menu")
  end
  it 'Add menu item' do
    expect(menu.add_item("Chicken nuggets", 6)).to eq(menu.instance_variable_get(:@menu))
  end
  it 'Remove menu item' do
    expect(menu.remove_item("Tomato soup")).to eq(menu.instance_variable_get(:@menu))
  end
end
