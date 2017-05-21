require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:item) { double('item', name: 'Burger', price: 3) }

  it { is_expected.to respond_to(:add_item) }

  it 'has an empty array for item' do
    expect(menu.items).to be_empty
  end

  it 'adding an item to the menu list changes its length by 1' do
    puts "visibility beg #{menu.items.count}"
    expect { menu.add_item(item.name, item.price) }.to change { menu.items.count }.from(0).to(1)

  end

end
