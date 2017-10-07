require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'stores menu items' do
    expect(menu).to respond_to(:menu_items)
  end

  it 'returns menu_items in readable form' do
    allow(menu).to receive(:menu_items) { [{item_num: 1, item: "Murgh Masala", cost: 6.9}] }
    expect(menu.view_menu).to eq("Avo Spice Menu:\n1) Murgh Masala - 6.9\n")
  end
end
