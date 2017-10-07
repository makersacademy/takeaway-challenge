require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'stores menu items' do
    expect(menu).to respond_to(:menu_items)
  end

  it 'prints menu_items in readable form' do
    #allow(menu).to receive(:menu_items) { [{item_num: 1, item: "Murgh Masala", cost: 6.9}] }
    expect(menu).to respond_to(:view_menu)
  end
end
