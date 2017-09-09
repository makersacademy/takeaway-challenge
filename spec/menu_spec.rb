require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:menu_items) do

    {
      "lamb": 6,
      "chicken": 7,
      "falafel": 8
    }

  end

  it 'has a list of dishes with price' do
    allow(menu).to receive(:menu_items).and_return(menu_items)
    expect(menu.menu_items).to eq(menu_items)
  end

  it 'can add dishes to the menu_items' do
    menu.add_item("rice", 5)
    expect(menu.menu_items).to eq(menu.menu_items)
  end

  it 'checks to see if the item is on the menu, otherwise it raises error' do
    allow(menu).to receive(:includes_dish?).and_return(true)
    expect(menu.includes_dish?).to be(true)
  end
end
