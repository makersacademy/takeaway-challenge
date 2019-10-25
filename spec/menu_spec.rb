require 'menu'

describe Menu do
  it 'creates an instance of Menu' do
    expect(subject).to be_an_instance_of Menu
  end

  it 'creates an array with menu items and their prices' do
    expect(subject.menu_items).not_to be_empty
  end

  it 'prints out the menu items' do
    expect(subject.view_menu).to output menu_items
  end
end