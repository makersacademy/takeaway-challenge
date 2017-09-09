require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:menu_items) {double(:menu_items)}
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

end
