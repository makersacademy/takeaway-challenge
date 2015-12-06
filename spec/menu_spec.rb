require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'should initialize with an empty menu_list' do
    expect(menu.list).to be_empty
  end

  it 'should be possible to add items to the menu' do
    menu.add_item(:shrimp, 1.88)
    expect(menu.list).to include(shrimp: 1.88)
  end


end
