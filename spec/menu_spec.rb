require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish) { double(:dish) }

  it 'has a list available of items available on the menu' do
    menu.items << dish
    expect(menu.items).to include(dish)
  end
  it 'lets the user add items to the menu' do
    menu.add_item(:Pizza, 9)
    expect(menu.items[-1].name).to eq(:Pizza)
  end
end
