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
    expect(menu.includes_dish?(:chicken)).to be(false)
  end

  it 'validates that there is this item on the menu' do
    expect(menu.includes_dish?("spring roll")).to be(true)
  end

  it 'returns false if there is not an item of the menu' do
    expect(menu.includes_dish?("nutella")).to be(false)
  end

  it 'calculates a price' do
    expect(menu.price(:chicken)).to eq(menu.menu_items[:chicken])
  end
end
